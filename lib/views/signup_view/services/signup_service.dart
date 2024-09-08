import 'package:dio/dio.dart';
import 'package:whats_app_ui/base/networking/dio_instance.dart';
import 'package:whats_app_ui/utils/constants/t_url.dart';

class SignupService {
  final dio = DioInstance().dio;

  Future<Response> registerUser ( 
      String email, String fullname, String password) async {

    return  await dio.post(TUrl.signUpUrl, data: {
        "full_name": fullname,
        "email": email,
        "password": password,
      });   
    } 

  }

