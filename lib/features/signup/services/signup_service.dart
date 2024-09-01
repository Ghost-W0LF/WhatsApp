import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:whats_app_ui/utils/constants/t_url.dart';

class SignupService {
  Future<void> registerUser(
      String email, String fullname, String password) async {
    try {
      final response = await http.post(Uri.parse(TUrl.signUpUrl), body: {
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
        debugPrint('Login failed: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      debugPrint("error:$e");
    }
  }
}
