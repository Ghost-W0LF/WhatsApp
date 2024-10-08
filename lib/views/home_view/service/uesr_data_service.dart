import 'package:dio/dio.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';

class UserDataService {
      final dio = DioInstance().dio;
   Future<Response> postUser() async {
    try {
      return await dio.get(TUrl.dataUrl);
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
