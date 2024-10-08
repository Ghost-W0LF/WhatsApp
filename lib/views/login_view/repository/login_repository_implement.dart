import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/components/snack_bar/snackbar_service.dart';
import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/base/navigation/routes.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';
import 'package:whats_app_ui/views/login_view/model/login_request_model.dart';
import 'package:whats_app_ui/views/login_view/repository/login_repository.dart';
import 'package:whats_app_ui/views/login_view/view_model/services/login_service.dart';

class LoginRepositoryImplement with SnackBarService implements LoginRepository {
  final dio = DioInstance().dio;
  LoginService loginService = LoginService();
  @override
  Future<String?> loginAuth(LoginRequestModel loginRequest) async {
    final response = await loginService.postLogin(loginRequest);
    TokenStorage tokenStorage = TokenStorage();
    try {
      if (response.statusCode == 200) {
        String token = response.data['token'];
        debugPrint('The token is $token');
        tokenStorage.writeToken(token);
        NavigationService().replaceTo(Routes.homeView);
        SnackBarService.showSnackBar("Processing Data");

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
