import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';
import 'package:whats_app_ui/views/login_view/services/auth_interceptor.dart';
import 'package:whats_app_ui/views/login_view/services/toeken_storage.dart';

class LoginService {
  final TokenStorage tokenStorage = TokenStorage();
  final dio = Dio();

  LoginService() {
    // Add AuthInterceptor to Dio
    dio.interceptors.add(AuthInterceptor());
  }

  Future<String?> loginAuth(String email, String password) async {
    try {
      Response response;

      response = await dio.post(TUrl.loginUrl,
          data: jsonEncode({'username': email, 'password': password}));
      Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      if (response.statusCode == 200) {
        String token = response.data['token'];
        debugPrint('The token is $token');

        debugPrint("The token is ${response.headers}");

        tokenStorage.writeToken(token);

        return token;
      } else {
        debugPrint('Login failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint("The error is: $e");
    }
    return null;
  }
}
