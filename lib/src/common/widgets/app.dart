import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_plus_app/l10n/app_localizations.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/routes/app_routes.dart';
import 'package:movie_plus_app/src/common/services/auth_service.dart';
import 'package:movie_plus_app/src/common/services/firestore_service.dart';
import 'package:movie_plus_app/src/ui/controllers/not_connect/connect_listener.dart';
import 'package:movie_plus_app/src/ui/controllers/not_connect/connection/connection_bloc.dart';
import 'package:movie_plus_app/src/ui/pages/auth/bloc/auth_bloc.dart';
import 'package:movie_plus_app/src/ui/pages/splash/controllers/lang_bloc/lang_bloc.dart';

class App extends StatelessWidget {
  const App({super.key, required this.status});

  final ConnectionStatus status;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      ensureScreenSize: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LangBloc(),
            ),
            BlocProvider(
              create: (context) => ConnectionBloc(status: status),
            ),
            BlocProvider(
              create: (context) => AuthBloc(
                authService: AuthService(),
                dbService: FirestoreService(),
              ),
            ),
          ],
          child: BlocBuilder<LangBloc, LangState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Movie Plus",
                theme: ThemeData(
                  useMaterial3: true,
                  scaffoldBackgroundColor: AppColors.scaffoldBG,
                  fontFamily: "Inter",
                ),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routes: AppRoutes.routes,
                initialRoute: FirebaseAuth.instance.currentUser == null
                    ? AppRoutes.initialRoute
                    : AppRoutes.home,
                builder: (context, child) {
                  return ConnectionListener(child: child!);
                },
                locale: Locale(state.locale),
              );
            },
          ),
        );
      },
    );
  }
}
