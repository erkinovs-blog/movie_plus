import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movie_plus_app/src/ui/controllers/not_connect/connection/connection_bloc.dart';

class ConnectionModel {
  static final _connectivity = Connectivity();
  static final stream = _connectivity.onConnectivityChanged.asBroadcastStream();

  static Stream<ConnectionStatus> streamConverter() {
    return stream.transform(StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        if (data == ConnectivityResult.none) {
          sink.add(ConnectionStatus.notConnected);
        } else {
          sink.add(ConnectionStatus.connected);
        }
      },
    ));
  }
}
