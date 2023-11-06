part of 'connection_bloc.dart';

enum ConnectionStatus {
  connected("You are online"),
  notConnected("Check connection");

  final String text;

  const ConnectionStatus(this.text);
}

@immutable
abstract class ConnectionState {
  ConnectionStatus get status;
}

class Connection extends ConnectionState {
  @override
  final ConnectionStatus status;

  Connection({required this.status});
}
