import 'package:dio/dio.dart';
import 'package:whats_app_ui/views/home_view/model/user_data_model.dart';

import 'package:whats_app_ui/utils/constants/t_url.dart';

class UserDataService {
  Future<UserData> fetchUser() async {
    final dio = Dio();
    final response = await dio.get(TUrl.dataUrl);

    if (response.statusCode == 200) {
      try {
        return UserData.fromJson(response.data);
      } catch (e) {
        throw Exception('Failed to parse weather data: $e');
      }
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}
