import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';
import 'package:whats_app_ui/views/login_view/view_model/interceptor/auth_interceptor.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';

class LoginService {
  final TokenStorage tokenStorage = TokenStorage();
  final dio = Dio();

  LoginService() {
    // Add AuthInterceptor to Dio
    dio.interceptors.add(AuthInterceptor());
    // dio.interceptors.add(LogInterceptor());
  }

  Future<String?> loginAuth(String email, String password) async {
    try {
      Response response;

      //baseUrl
      dio.options.baseUrl = TUrl.baseUrl;

      response = await dio.post('/login/',
          data: jsonEncode({'username': email, 'password': password}));

      if (response.statusCode == 200) {
        String token = response.data['token'];
        debugPrint('The token is $token');

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
