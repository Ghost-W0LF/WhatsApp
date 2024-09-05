import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/navigation/navigation_service.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';

class CheckToken {
  NavigationService service = NavigationService();

  BuildContext? context;
  TokenStorage tokenStorage = TokenStorage();
  void checkToken() async {
    String? savedToken = await tokenStorage.readToken();
    if (savedToken != null) {
      service.replaceTo('/homeView');
    } else {
      return null;
    }
  }
}
