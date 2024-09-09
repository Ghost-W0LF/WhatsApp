import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage  {
  bool isLoggedIn = false;
  final tokenStorage = const FlutterSecureStorage();

  Future<void> writeToken(String token) async {
    await tokenStorage.write(key: 'token', value: token);

  }

  Future<String?> readToken() async {
    String? savedToken = await tokenStorage.read(key: 'token');

    return savedToken;
  }

  Future<void> deletToken(String key) async {
    await tokenStorage.delete(key: key);

  }

}
