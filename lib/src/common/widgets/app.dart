import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_plus_app/l10n/app_localizations.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/routes/app_routes.dart';
import 'package:movie_plus_app/src/ui/controllers/not_connect/connection/connection_bloc.dart';
import 'package:movie_plus_app/src/ui/pages/splash/controllers/lang_bloc/lang_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

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
              create: (context) => ConnectionBloc(),
            )
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
                initialRoute: AppRoutes.initialRoute,
                locale: Locale(state.locale),
              );
            },
          ),
        );
      },
    );
  }
}
