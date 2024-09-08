import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/views/signup_view/services/signup_service.dart';

abstract class SignupRepository {
  Future<void> signupAuth(String email, String fullname, String password);
}


  

