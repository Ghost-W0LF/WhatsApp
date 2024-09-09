import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:whats_app_ui/base/components/snack_bar/snackbar_service.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';

class AuthInterceptor extends InterceptorsWrapper with SnackBarService {
  final TokenStorage tokenStorage = TokenStorage();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final savedToken = await tokenStorage.readToken();
    final List<String> tokenRequired = ['/login/', TUrl.dataUrl];

    if (tokenRequired.contains(options.path) ||
        tokenRequired.contains(options.uri.toString())) {
      if (savedToken != null) {
        options.headers['Authorization'] = 'Bearer $savedToken';
        debugPrint("Token Sent to the site");
      }
    }

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
        SnackBarService.showSnackBar("Invalid Email or Password");
        debugPrint('Unauthorized access ');
      }
      if (err.response!.statusCode == 204) {
        debugPrint('There is no information to show');
      }
      if (err.response!.statusCode == 408) {
        debugPrint('Request Time out');
      }
      if (err.response!.statusCode == 503) {
        debugPrint('Service Unavailable');
      }
      return super.onError(err, handler);
    }
  }
}
