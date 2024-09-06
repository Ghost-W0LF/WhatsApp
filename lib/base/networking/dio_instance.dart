import 'package:dio/dio.dart';
import 'package:whats_app_ui/views/login_view/view_model/interceptor/auth_interceptor.dart';

class DioInstance {
  DioInstance() {
    // Add AuthInterceptor to Dio
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(LogInterceptor());
  }
  final dio = Dio(BaseOptions());
}
