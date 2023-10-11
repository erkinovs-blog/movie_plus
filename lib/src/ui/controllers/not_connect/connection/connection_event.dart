part of 'connection_bloc.dart';

@immutable
abstract class ConnectionEvent {}

class NoConnection extends ConnectionEvent {}

class HasConnection extends ConnectionEvent {}
