import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/ui/pages/splash/splash_intro.dart';
import 'package:movie_plus_app/src/ui/pages/splash/splash_lang_selector.dart';
import 'package:movie_plus_app/src/ui/pages/splash/splash_page.dart';

abstract class AppRoutes {
  static const initialRoute = "/splash-intro";

  static final Map<String, Widget Function(BuildContext context)> routes = {
    initialRoute: (context) => const SplashIntro(),
    "/splash-lang": (context) => const SplashLangSelector(),
    "/splash-page": (context) => const SplashPage(),
  };
}
