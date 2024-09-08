import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage extends ChangeNotifier {
  bool isLoggedIn = false;
  final tokenStorage = const FlutterSecureStorage();

  Future<void> writeToken(String token) async {
    await tokenStorage.write(key: 'token', value: token);
    notifyListeners();
  }

  Future<String?> readToken() async {
    String? savedToken = await tokenStorage.read(key: 'token');
    notifyListeners();
    return savedToken;
  }

  Future<void> deletToken(String key) async {
    await tokenStorage.delete(key: key);
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
