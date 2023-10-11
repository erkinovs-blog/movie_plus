part of 'connection_bloc.dart';

@immutable
abstract class ConnectionState {}

class ConnectionInitial extends ConnectionState {}

class Connected extends ConnectionState {}

class NotConnected extends ConnectionState {}
