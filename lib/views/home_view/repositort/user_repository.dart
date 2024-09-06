import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/home_view/home_view_model/service/uesr_data_service.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_model.dart';

class UserRepository {
  UesrDataService uesrDataService = UesrDataService();
  Future<UserData?> getUserData() async {
    final response = await uesrDataService.apiCall();
    try {
      return UserData.fromJson(response.data);
    } catch (e) {
      debugPrint("REpo error:-$e");
    }
    return null;
  }
}
