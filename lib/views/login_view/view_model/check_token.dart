import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/home_view/view/home_view.dart';
import 'package:whats_app_ui/base/tokenstorage/toeken_storage.dart';

class CheckToken {

  BuildContext? context;
  TokenStorage tokenStorage = TokenStorage();
  void checkToken(BuildContext context) async {
    String? savedToken = await tokenStorage.readToken();
    if (savedToken != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } else {
      return null;
    }
  }
}
