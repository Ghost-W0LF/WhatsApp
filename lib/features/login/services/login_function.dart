import 'package:flutter/material.dart';
import 'package:whats_app_ui/features/home_page/view/home_view.dart';
import 'package:whats_app_ui/features/login/services/login_service.dart';

class LoginFunction {
  LoginFunction({
    required this.emailController,
    required this.passwordController,
    required this.context,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final BuildContext context;

  //instance
   final LoginService _loginService = LoginService();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    String? token = await _loginService.login(email, password);

    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
      debugPrint('Login successful, token: $token');
    } else {
      if (emailController.text.isEmpty ||
          !emailController.text.contains('@') ||
          !emailController.text.contains('.com')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid Email'),
          ),
        );
      } else if (passwordController.text.isEmpty ||
          passwordController.text.length != 8) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid Password'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid Email or Password'),
          ),
        );
      }

      // Show an error message
      debugPrint('Login failed: $token');
    }
  }
}
