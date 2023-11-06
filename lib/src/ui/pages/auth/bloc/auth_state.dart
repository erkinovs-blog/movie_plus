part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();

  abstract final UserModel? user;
}

class AuthInitial extends AuthState {
  @override
  UserModel? get user => null;
}

class AuthSuccess extends AuthState {
  @override
  final UserModel user;

  const AuthSuccess(this.user);
}
