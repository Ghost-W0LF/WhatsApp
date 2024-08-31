import 'dart:convert';

import 'package:whats_app_ui/data/models/user_data_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String url = "https://reqres.in/api/users?page=2";

  Future<UserData> fetchUser() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      try {
        return UserData.fromJson(jsonDecode(response.body));
      } catch (e) {
        throw Exception('Failed to parse weather data: $e');
      }
    } else {
      throw Exception(
          'Failed to load weather data: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
