import 'package:whats_app_ui/base/components/snackbar_service.dart';
import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';

import 'package:whats_app_ui/views/login_view/view_model/services/login_service.dart';
import 'package:flutter/material.dart';

class LoginRepository {
  final dio = DioInstance().dio;
  LoginService loginService = LoginService();

  Future<String?> loginAuth(String email, String password) async {
    final response = await loginService.postLogin(email, password);
    TokenStorage tokenStorage = TokenStorage();
    try {
      if (response.statusCode == 200) {
        String token = response.data['token'];
        debugPrint('The token is $token');
        tokenStorage.writeToken(token);
        NavigationService().replaceTo('/homeView');

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
