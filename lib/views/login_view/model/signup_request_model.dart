class SignupRequestModel {
  SignupRequestModel({
    required this.email,
    required this.password,
    required this.userName,
  });
  final String email;
  final String password;
  final String userName;
  Map<String, dynamic> toJson() {
    return {
      'fullNamesign': email,
      'password': password,
      'email': email,
    };
  }
}
