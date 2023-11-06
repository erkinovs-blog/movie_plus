part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthSuccessEvent extends AuthEvent {
  final UserModel user;
  const AuthSuccessEvent(this.user);
}

class AuthErrorEvent extends AuthEvent {}
