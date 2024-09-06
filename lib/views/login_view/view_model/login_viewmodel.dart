import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/components/snackbar_service.dart';
import 'package:whats_app_ui/base/navigation/navigation_service.dart';

import 'package:whats_app_ui/views/login_view/view_model/services/login_service.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  //navigation
  NavigationService service = NavigationService();

  //login function to login
  void requestLogin(
    bool mounted,
    BuildContext context,
  ) async {
    final LoginService loginService = LoginService();

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    String? token = await loginService.loginAuth(email, password);

    if (mounted) {
      if (loginFormKey.currentState!.validate()) {
        SnackBarService.showSnackBar(
            content: 'Processing Data',
            duration: const Duration(milliseconds: 400));
        if (token != null) {
          //
          service.replaceTo('/homeView');
          passwordController.clear();

          debugPrint('Login successful, token: $token');
        }
        if (token == null) {
          SnackBarService.showSnackBar(
              content: 'Invalid Email or Password',
              duration: const Duration(milliseconds: 800));

          //
          // Show an error message
          debugPrint('Login failed: $token');
        }
        //
        //
      }
    }
    return null;
  }

  void onPressed() {}
}
