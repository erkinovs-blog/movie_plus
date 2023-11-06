import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/ui/pages/auth/login/login_page.dart';
import 'package:movie_plus_app/src/ui/pages/auth/sign_up/sign_up_page.dart';
import 'package:movie_plus_app/src/ui/pages/home/home_page.dart';
import 'package:movie_plus_app/src/ui/pages/splash/splash_lang_selector.dart';
import 'package:movie_plus_app/src/ui/pages/splash/splash_page.dart';

abstract class AppRoutes {
  static const initialRoute = "/";
  static const splash = "/splash";
  static const login = "/login";
  static const signUp = "/sign-up";
  static const home = "/home";


  static final Map<String, Widget Function(BuildContext context)> routes = {
    initialRoute: (context) => const SplashLangSelector(),
    splash: (context) => const SplashPage(),
    login: (context) => const LoginPage(),
    signUp: (context) => const SignUpPage(),
    home: (context) => const HomePage(),
  };
}
