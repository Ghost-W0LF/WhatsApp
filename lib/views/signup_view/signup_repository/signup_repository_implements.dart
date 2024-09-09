import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/views/login_view/model/signup_request_model.dart';
import 'package:whats_app_ui/views/signup_view/services/signup_service.dart';
import 'package:whats_app_ui/views/signup_view/signup_repository/signup_repository.dart';

class SignupRepositoryImplements implements SignupRepository{
   final dio = DioInstance().dio;
  SignupService signupService = SignupService();
  @override

  
  Future<void> signupAuth(
      SignupRequestModel signupRequestModel) async {
    final response =
        await signupService.registerUser(signupRequestModel);
    try {
      if (response.statusCode == 200) {
        final data = response.data;
        debugPrint('User ID: ${data['full_name']}');
        debugPrint("Register Success");
      } else {
        debugPrint("Register Failed");
        debugPrint('Login failed: ${response.statusCode} ');
      }
    } catch (e) {
      debugPrint('Login failed: $e');
    }
  }
  
}