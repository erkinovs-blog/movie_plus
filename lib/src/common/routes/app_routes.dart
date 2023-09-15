import 'package:movie_plus_app/src/ui/pages/splash/splash_intro.dart';
import 'package:movie_plus_app/src/ui/pages/splash/splash_page.dart';

abstract class AppRoutes {
  static const initialRoute = "/splash-intro";

  static final routes = {
    initialRoute: (context) => const SplashIntro(),
    "/splash-page": (context) => const SplashPage(),
  };
}
