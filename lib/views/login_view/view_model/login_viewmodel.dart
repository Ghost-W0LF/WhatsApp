import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/components/base_view_model/base_view.dart';

import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';
import 'package:whats_app_ui/views/login_view/model/login_request_model.dart';
import 'package:whats_app_ui/views/login_view/repository/login_repository_implement.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  //navigation
  NavigationService service = NavigationService();
  LoginRepositoryImplement loginRepo = LoginRepositoryImplement();

  //login function to login
  void requestLogin() async {
    //TextEditingController
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    //passing TextEditingController to
    loginRepo.loginAuth(LoginRequestModel(email: email, password: password));

    //
    //Disposing the Controllers
    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

//
//Token Storage
    TokenStorage tokenStorage = TokenStorage();
    String? token = await tokenStorage.readToken();

    if (loginFormKey.currentState!.validate()) {
      const Duration(milliseconds: 800);
      if (token != null) {
        passwordController.clear();

        debugPrint('Login successful, token: $token');
        dispose();
      }
      if (token == null) {
        passwordController.clear();

        //
        // Show an error message
        debugPrint('Login failed: $token');
      } else {}
    }
    return null;
  }
}
