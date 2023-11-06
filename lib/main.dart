import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_plus_app/firebase_options.dart';
import 'package:movie_plus_app/src/common/data/storage/storage.dart';
import 'package:movie_plus_app/src/common/widgets/app.dart';
import 'package:movie_plus_app/src/common/widgets/error_app.dart';
import 'package:movie_plus_app/src/common/widgets/splash_app.dart';
import 'package:movie_plus_app/src/ui/controllers/not_connect/connection/connection_bloc.dart';
import 'package:movie_plus_app/src/ui/controllers/not_connect/connection_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  $initializeApp(
    initialize: [
      () async => Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
      () async => $storage = await SharedPreferences.getInstance(),
      () async => Future.value(),
    ],
    splash: (progress) => SplashApp(progress: progress),
    success: (status) => App(status: status),
    error: (error) => ErrorApp(error: error),
  );
}

void $initializeApp({
  required List<Future Function()> initialize,
  required Widget Function(ValueNotifier<double> progress) splash,
  required Widget Function(ConnectionStatus status) success,
  required Widget Function(Object error) error,
}) async {
  final ValueNotifier<double> progress = ValueNotifier(0);
  ConnectionStatus status = ConnectionStatus.notConnected;
  runApp(splash(progress));

  try {
    double percentage = 1 / initialize.length;
    for (final function in initialize) {
      progress.value = progress.value + percentage;
      await function.call();
      await Future.delayed(const Duration(seconds: 1));
    }
    late StreamSubscription subscription;
    subscription = ConnectionModel.streamConverter().listen(
      (event) async {
        status = event;
        await subscription.cancel();
      },
    );
    runApp(success(status));
  } catch (e) {
    runApp(error(e));
  }
}
