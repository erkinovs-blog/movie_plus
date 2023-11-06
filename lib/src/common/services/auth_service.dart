import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_plus_app/src/common/services/repositories/auth_repository.dart';

class AuthService extends AuthServiceRepository {
  static final _auth = FirebaseAuth.instance;

  @override
  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user?.uid;
  }

  @override
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user?.uid;
  }

  @override
  Future<void> logOut() => _auth.signOut();
}
