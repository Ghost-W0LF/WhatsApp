import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';
import 'package:whats_app_ui/views/login_view/view_model/interceptor/auth_interceptor.dart';

class SignupService {
  final dio = Dio();
  SignupService() {
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(LogInterceptor());
  }
  Future<void> registerUser(
      String email, String fullname, String password) async {
    try {
      final response = await dio.post(TUrl.signUpUrl, data: {
        "full_name": fullname,
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        final data = response.data;
        debugPrint('User ID: ${data['full_name']}');
        debugPrint("Register Success");
      } else {
        debugPrint("Register Failed");
        debugPrint('Login failed: ${response.statusCode} ');
      }
    } catch (e) {
      debugPrint("error:$e");
    }
  }
}
