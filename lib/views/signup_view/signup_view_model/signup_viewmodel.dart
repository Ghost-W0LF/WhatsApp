import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/components/snack_bar/snackbar_service.dart';
import 'package:whats_app_ui/views/signup_view/services/signup_service.dart';

class SignupViewmodel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailComtroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  final register = SignupService();

  void createAccount() {
    if (signUpKey.currentState!.validate()) {
      register.registerUser(
          emailComtroller.text, nameController.text, passwordController.text);
      SnackBarService.showSnackBar(
          content: "Processing Data",
          duration: const Duration(milliseconds: 400));
    } else {
      debugPrint("error");
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
