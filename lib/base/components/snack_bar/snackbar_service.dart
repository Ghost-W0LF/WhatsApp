import 'package:flutter/material.dart';

mixin SnackBarService {
   static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static void showSnackBar(String? content,) {
    
     scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(content??"no data"),
      duration: const Duration(milliseconds: 200),
    ));

  }
}
