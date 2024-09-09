import 'package:dio/dio.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';
import 'package:whats_app_ui/views/login_view/model/signup_request_model.dart';

class SignupService {
  final dio = DioInstance().dio;

  Future<Response> registerUser(SignupRequestModel signupRequestModel) async {
    return await dio.post(TUrl.signUpUrl, data: {signupRequestModel});
  }
}
