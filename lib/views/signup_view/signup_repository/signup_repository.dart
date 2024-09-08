abstract class SignupRepository {
  Future<void> signupAuth(String email, String fullname, String password);
}
