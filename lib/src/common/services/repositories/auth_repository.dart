abstract class AuthServiceRepository {
  Future<String?> signUp({
    required String email,
    required String password,
  });

  Future<String?> login({
    required String email,
    required String password,
  });

  Future<void> logOut();
}