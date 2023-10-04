import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/data/storage/storage.dart';
import 'package:movie_plus_app/src/common/widgets/app.dart';
import 'package:movie_plus_app/src/common/widgets/error_app.dart';
import 'package:movie_plus_app/src/common/widgets/splash_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SplashApp());

  try {
    await Future.delayed(
      const Duration(seconds: 2),
      () async {
        $storage = await SharedPreferences.getInstance();
      },
    );
    runApp(const App());
  } catch (e) {
    runApp(const ErrorApp());
  }
}
