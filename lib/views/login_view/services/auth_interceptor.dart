import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/login_view/services/toeken_storage.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final TokenStorage tokenStorage = TokenStorage();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = 'Bearer ${tokenStorage.readToken()}';
    return handler.next(options);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      if (err.response!.statusCode == 400) {
        debugPrint('Unauthorized access - maybe need to re-authenticate');
      }
      return super.onError(err, handler);
    }
  }
}
