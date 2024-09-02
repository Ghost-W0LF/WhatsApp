import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';

class LoginService {
  Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(TUrl.loginUrl), body: {
        'username': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        return data['token'];
      } else {
        debugPrint(
            'Login failed: ${response.statusCode} ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
