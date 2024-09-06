import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';

class LoginService {
  final dio = DioInstance().dio;
  Future<Response> postLogin(String? email, String? password) async {
    return await dio.post(TUrl.loginUrl,
        data: jsonEncode({'username': email, 'password': password}));
  }
}
