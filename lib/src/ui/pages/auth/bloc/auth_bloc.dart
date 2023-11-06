import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_plus_app/src/common/services/repositories/auth_repository.dart';
import 'package:movie_plus_app/src/common/services/repositories/database_repository.dart';
import 'package:movie_plus_app/src/ui/pages/auth/models/user_model.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServiceRepository _authService;
  DatabaseServiceRepository _dbService;

  AuthBloc({
    required AuthServiceRepository authService,
    required DatabaseServiceRepository dbService,
  })  : _authService = authService,
        _dbService = dbService,
        super(AuthInitial()) {
    on<AuthSuccessEvent>((event, emit) => emit(AuthSuccess(event.user)));
    on<AuthErrorEvent>((event, emit) => emit(AuthInitial()));
  }

  Future<void> logOut() async {
    _dbService = _dbService.newInstance();
    return _authService.logOut();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    String? uid = await _authService.login(email: email, password: password);
    if(uid != null) {
      await _dbService.getUser(userId: uid);
      add(AuthSuccessEvent(_dbService.currentUser));
    }else {
      add(AuthErrorEvent());
    }
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    String? uid = await _authService.signUp(email: email, password: password);
    if (uid != null) {
      final user = UserModel(
        id: uid,
        email: email,
        name: name,
      );
      await _dbService.createUser(user: user);
      add(AuthSuccessEvent(user));

    } else {
      throw Error.throwWithStackTrace("Xato", StackTrace.current);
    }
  }
}
