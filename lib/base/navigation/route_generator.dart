import 'package:flutter/material.dart';
import 'package:whats_app_ui/views/home_view/view/home_view.dart';
import 'package:whats_app_ui/views/login_view/view/login_view.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    try {
      switch (settings.name) {
        case '/loginView':
          return MaterialPageRoute(builder: (context) => const LoginView());
        case '/homeView':
          return MaterialPageRoute(builder: (context) => const HomeView());
      }
    } catch (e) {
      debugPrint("Error while routing: $e");
    }
    return null;
  }
}
