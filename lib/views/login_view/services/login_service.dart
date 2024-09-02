import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:whats_app_ui/utils/constants/t_url.dart';
import 'package:whats_app_ui/views/login_view/services/toeken_storage.dart';

class LoginService {
  final TokenStorage tokenStorage = TokenStorage();

  Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(TUrl.loginUrl), body: {
        'username': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // String token = data['token'];
        tokenStorage.writeToken(data['token']);

        
        // Check if token is saved
        String? savedToken = await tokenStorage.readToken();
        if (savedToken != null) {
          debugPrint('Token saved successfully: $savedToken');
        } else {
          debugPrint('Failed to save token.');
        }

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
