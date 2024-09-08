import 'package:whats_app_ui/views/home_view/model/user_data_model.dart';

abstract class UserRepository {
  Future<UserData?> getUserData();
}