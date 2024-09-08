import 'package:flutter/material.dart';

class SnackBarService {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(
      {required String content, required Duration duration}) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(content),
      duration: duration,
    ));
  }
}
