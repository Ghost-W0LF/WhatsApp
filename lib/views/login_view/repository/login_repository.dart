import 'package:whats_app_ui/views/login_view/model/login_request_model.dart';

abstract class LoginRepository {
  Future<String?> loginAuth(LoginRequestModel loginRequest);
}