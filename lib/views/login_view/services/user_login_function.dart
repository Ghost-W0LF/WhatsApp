import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/home_view/view/home_view.dart';
import 'package:whats_app_ui/views/login_view/services/login_service.dart';

class UserLoginFunction {
  //login function to login
  void login(
      TextEditingController emailController,
      TextEditingController passwordController,
      bool mounted,
      BuildContext context) async {
    final LoginService loginService = LoginService();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    String? token = await loginService.loginAuth(email, password);

    if (mounted) {
      String tkn = '$token';
      if (token != null) {
        //
        //
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );

        debugPrint('Login successful, token: $tkn');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid Email or Password')),
        );
        //
        //
        // Show an error message
        debugPrint('Login failed: $token');
      }
    }
    return null;
  }
}
