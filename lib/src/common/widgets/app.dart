import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_plus_app/l10n/app_localizations.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/models/lang_model.dart';
import 'package:movie_plus_app/src/common/routes/app_routes.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      ensureScreenSize: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => LangModel(),
          builder: (context, child) {
            return Consumer<LangModel>(
              builder: (context, value, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Movie Plus",
                  theme: ThemeData(
                    useMaterial3: true,
                    scaffoldBackgroundColor: AppColors.scaffoldBG,
                  ),
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  routes: AppRoutes.routes,
                  initialRoute: AppRoutes.initialRoute,
                  locale: value.current,
                );
              },
            );
          },
        );
      },
    );
  }
}
