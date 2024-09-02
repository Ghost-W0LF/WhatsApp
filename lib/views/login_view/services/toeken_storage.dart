import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final tokenStorage = const FlutterSecureStorage();

  Future<void> writeToken(String token) async {
    await tokenStorage.write(key: 'token', value: token);
  }

  Future<String?> readToken() async {
    return await tokenStorage.read(key: 'token');
  }

  deletToken(String key) async {
    await tokenStorage.delete(key: key);
  }
}
