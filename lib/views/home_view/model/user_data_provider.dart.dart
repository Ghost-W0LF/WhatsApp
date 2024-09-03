import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_model.dart';
import 'package:whats_app_ui/views/home_view/service/uesr_data_service.dart';

class UserDataProvider with ChangeNotifier {
  UserData data = UserData(data: []);

  final userDataService = UserDataService();
  bool isLoading = false;

  Future<void> getPostData(BuildContext context) async {
    isLoading = true;
    try {
      data = await userDataService.fetchUser();
    } catch (e) {
      debugPrint('Error is $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
