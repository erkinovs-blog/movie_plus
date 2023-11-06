import 'package:movie_plus_app/src/ui/pages/auth/models/user_model.dart';

abstract class DatabaseServiceRepository {
  UserModel get currentUser;
  bool get isHaveUser;
  String getNewUserId();
  Future<void> createUser({required UserModel user});
  Future<void> updateUser({required UserModel user});
  Future<void> saveUser();
  Future<void> getUser({required String userId});
  T newInstance<T extends DatabaseServiceRepository>();
}
