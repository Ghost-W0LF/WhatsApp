import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Register {
  final baseUrl = "https://tbe.thuprai.com/v1/api/signup/";
  Future<void> register_user(
      String email, String fullname, String password) async {
    try {
      final response = await http.post(Uri.parse(baseUrl), body: {
        "full_name": fullname,
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint('User ID: ${data['userId']}');
        debugPrint("Register Success");
      } else {
        debugPrint("Register Failed");
        print('Login failed: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint("error:$e");
    }
  }
}
