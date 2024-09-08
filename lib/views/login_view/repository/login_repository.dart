import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';

import 'package:whats_app_ui/views/login_view/view_model/services/login_service.dart';
import 'package:flutter/material.dart';

abstract class LoginRepository {
  Future<String?> loginAuth(String email, String password);
}