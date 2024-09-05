import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  dynamic replaceTo(String route, {dynamic arguments}) {
    return navigatorKey.currentState
        ?.restorablePushReplacementNamed(route, arguments: arguments);
  }

  dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }
}
