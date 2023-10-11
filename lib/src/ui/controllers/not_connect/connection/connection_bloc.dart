import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  ConnectionBloc() : super(ConnectionInitial()) {
    _connectivity.onConnectivityChanged.listen(_listenConnect);
    on<NoConnection>((event, emit) => emit(NotConnected()));
    on<HasConnection>((event, emit) => emit(Connected()));
    _connectivity.checkConnectivity().then(_listenConnect);
  }

  void _listenConnect(ConnectivityResult event) {
    if (event == ConnectivityResult.none) {
      add(NoConnection());
    } else {
      add(HasConnection());
    }
  }

  static final _connectivity = Connectivity();
}
