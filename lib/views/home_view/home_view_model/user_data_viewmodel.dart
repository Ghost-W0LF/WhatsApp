import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_model.dart';

import 'package:whats_app_ui/views/home_view/repositort/user_repository.dart';


class UserDataViewModel extends ChangeNotifier {
  UserData uData = UserData(data: [
    
  ]);

  final userRepository = UserRepository();
  bool isLoading = false;

  Future<void> getPostData(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final featchedData = await userRepository.getUserData();
      if (featchedData != null) {
        uData = featchedData;
      } else {
        debugPrint('Failed to fetch data or data is null');
      }
    } catch (e) {
      debugPrint('this is the $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
