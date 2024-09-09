import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';
import 'package:whats_app_ui/views/login_view/model/login_request_model.dart';

class LoginService {
  final dio = DioInstance().dio;
  Future<Response> postLogin(LoginRequestModel loginRequest) async {
    return await dio.post(TUrl.loginUrl,
        data: jsonEncode(loginRequest.toJson())
        );
  }
}
