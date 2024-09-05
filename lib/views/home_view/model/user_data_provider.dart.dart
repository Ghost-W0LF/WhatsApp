import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_model.dart';
import 'package:whats_app_ui/views/home_view/home_view_model/service/uesr_data_service.dart';

class UserDataProvider extends ChangeNotifier {
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
