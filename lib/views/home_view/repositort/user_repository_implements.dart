import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_model.dart';
import 'package:whats_app_ui/views/home_view/repositort/user_repository.dart';
import 'package:whats_app_ui/views/home_view/service/uesr_data_service.dart';

class UserRepositoryImplements implements UserRepository {
  UserDataService uesrDataService = UserDataService();
  @override
  Future<UserData?> getUserData() async {
    final response = await uesrDataService.postUser
    ();
    try {
      return UserData.fromJson(response.data);
    } catch (e) {
      debugPrint("REpo error:-$e");
    }
    return null;
  }
}
