import 'package:flutter/material.dart';

class TextFormValidators extends ChangeNotifier{
  // Email validator
  String? emailValidators(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@') || !value.contains('.com')) {
      return 'Please enter a valid email || "@"".com"';
    }
    return null;
  }

// password validator
  String? passwordValidators(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Short Password';
    }
    return null;
  }

//Username validator
  String? userNameValidators(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your UserName';
    }

    return null;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
