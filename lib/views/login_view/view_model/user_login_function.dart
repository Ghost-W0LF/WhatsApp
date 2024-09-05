import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/home_view/view/home_view.dart';
import 'package:whats_app_ui/views/login_view/view_model/services/login_service.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login function to login
  void requestLogin(
    bool mounted,
    BuildContext context,
    GlobalKey<FormState> key,
  ) async {
    final LoginService loginService = LoginService();

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    String? token = await loginService.loginAuth(email, password);

    if (mounted) {
      if (key.currentState!.validate()) {
        if (token != null) {
          //
          //
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );

          debugPrint('Login successful, token: $token');
        }
        if (token == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid Email or Password')),
          );
          //
          //
          // Show an error message
          debugPrint('Login failed: $token');
        }
        //
        //

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Processing Data'),
            duration: Duration(milliseconds: 500),
          ),
        );
      }
    }
    return null;
  }

  void onPressed() {}
}
