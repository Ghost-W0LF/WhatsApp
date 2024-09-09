import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/components/snack_bar/snackbar_service.dart';
import 'package:whats_app_ui/views/login_view/model/signup_request_model.dart';
import 'package:whats_app_ui/views/signup_view/signup_repository/signup_repository_implements.dart';

class SignupViewmodel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailComtroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  final register = SignupRepositoryImplements();
  //dispose The controller
  @override
  void dispose() {
    nameController.dispose();
    emailComtroller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void createAccount() {
    try {
      if (signUpKey.currentState!.validate()) {
        register.signupAuth(SignupRequestModel(
            email: emailComtroller.toString(),
            password: passwordController.toString(),
            userName: nameController.toString()));
        SnackBarService.showSnackBar(
            content: "Processing Data",
            duration: const Duration(milliseconds: 400));
      }
    } catch (e) {
      debugPrint("The error is:- $e");
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
