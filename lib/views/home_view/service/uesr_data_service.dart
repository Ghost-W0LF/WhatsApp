import 'dart:convert';

import 'package:whats_app_ui/views/home_view/model/user_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:whats_app_ui/utils/constants/t_url.dart';

class UserDataService {
  Future<UserData> fetchUser() async {
    final response = await http.get(Uri.parse(TUrl.dataUrl));
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

  getPostData(contex) {}
}
