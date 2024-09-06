import 'package:dio/dio.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';

class UesrDataService {
      final dio = DioInstance().dio;
   Future<Response> apiCall() async {
    try {
      return await dio.get(TUrl.dataUrl);
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
