part of 'connection_bloc.dart';

@immutable
abstract class ConnectionEvent with _ConnectionEventPatternMatcher {}

class NoConnection extends ConnectionEvent {
  @override
  T map<T>({
    required T Function(NoConnection event) noConnection,
    required T Function(HasConnection event) hasConnection,
  }) =>
      noConnection(this);
}

class HasConnection extends ConnectionEvent {
  @override
  T map<T>({
    required T Function(NoConnection event) noConnection,
    required T Function(HasConnection event) hasConnection,
  }) =>
      hasConnection(this);
}

mixin _ConnectionEventPatternMatcher {
  T map<T>({
    required T Function(NoConnection event) noConnection,
    required T Function(HasConnection event) hasConnection,
  });
}
