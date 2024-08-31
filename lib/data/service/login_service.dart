import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const String baseUrl = "https://tbe.thuprai.com/v1/api/login/";

class LoginService {
  Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(baseUrl), body: {
        'username': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return data['token'];
      } else {
        print('Login failed: ${response.statusCode} ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
