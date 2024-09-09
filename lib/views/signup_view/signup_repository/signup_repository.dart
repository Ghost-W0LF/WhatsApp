import 'package:whats_app_ui/views/login_view/model/signup_request_model.dart';

abstract class SignupRepository {
  Future<void> signupAuth(SignupRequestModel signupRequestModel);
}
