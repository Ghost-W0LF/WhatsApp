import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';

class LoginService {
  final TokenStorage tokenStorage = TokenStorage();
  final dio = DioInstance().dio;
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
