abstract class LoginRepository {
  Future<String?> loginAuth(String email, String password);
}