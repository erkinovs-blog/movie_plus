import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_plus_app/src/common/services/repositories/database_repository.dart';
import 'package:movie_plus_app/src/ui/pages/auth/models/user_model.dart';

class FirestoreService extends DatabaseServiceRepository {
  UserModel? _currentUser;
  late final DocumentReference<Map<String, Object?>> userRef;

  static final _db = FirebaseFirestore.instance;

  @override
  UserModel get currentUser => _currentUser!;

  @override
  bool get isHaveUser => _currentUser != null;

  @override
  Future<void> getUser({required String userId}) async {
    userRef = _db.collection("users").doc(userId);
    final data = await userRef.get();
    if (data.exists) {
      _currentUser = UserModel.fromMap(data.data()!);
    } else {
      throw Exception("User not found");
    }
  }

  @override
  Future<void> updateUser({required UserModel user}) async {
    _currentUser = user;
    await saveUser();
  }

  @override
  Future<void> saveUser() async {
    await userRef.update(currentUser.toMap());
  }

  @override
  Future<void> createUser({required UserModel user}) async {
    userRef = _db.collection("users").doc(user.id);
    await userRef.set(user.toMap());
    _currentUser = user;
  }

  @override
  String getNewUserId() => _db.collection("users").doc().id;

  @override
  T newInstance<T extends DatabaseServiceRepository>() =>
      FirestoreService() as T;
}
