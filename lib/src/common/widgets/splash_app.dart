import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/constants/app_icons.dart';
import 'package:movie_plus_app/src/ui/utils/screen_size_resolver.dart';

class SplashApp extends StatefulWidget {
  const SplashApp({super.key});

  @override
  State<SplashApp> createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Splash Screen",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.scaffoldBG,
        body: Center(
          child: SvgPicture.asset(
            AppIcons.icLogo,
            width: AppScreen.width(context) * 0.4,
          ),
        ),
      ),
    );
  }
}
