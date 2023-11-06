import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:movie_plus_app/src/ui/controllers/not_connect/connection_model.dart';

part 'connection_event.dart';

part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  ConnectionBloc({required ConnectionStatus status})
      : super(Connection(status: status)) {
    on<ConnectionEvent>(
      (event, emit) => event.map(
        noConnection: (event) => _noConnection(event, emit),
        hasConnection: (event) => _hasConnection(event, emit),
      ),
    );
    ConnectionModel.streamConverter().listen(_listenConnect);
  }

  Future<ConnectionStatus> getStatus() async {
    return (await _connectivity.checkConnectivity()) == ConnectivityResult.none
        ? ConnectionStatus.notConnected
        : ConnectionStatus.connected;
  }

  void _listenConnect(ConnectionStatus result) {
    if (result == ConnectionStatus.notConnected) {
      add(NoConnection());
    } else {
      add(HasConnection());
    }
  }

  static final _connectivity = Connectivity();

  void _noConnection(NoConnection event, Emitter<ConnectionState> emit) =>
      emit(Connection(status: ConnectionStatus.notConnected));

  void _hasConnection(HasConnection event, Emitter<ConnectionState> emit) =>
      emit(Connection(status: ConnectionStatus.connected));
}
