import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/constants/app_icons.dart';
import 'package:movie_plus_app/src/ui/utils/screen_size_resolver.dart';

class SplashIntro extends StatefulWidget {
  const SplashIntro({super.key});

  @override
  State<SplashIntro> createState() => _SplashIntroState();
}

class _SplashIntroState extends State<SplashIntro> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, "/splash-page");
    },);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBG,
      body: Center(
        child: SvgPicture.asset(
          AppIcons.ic_logo,
          width: AppScreen.width(context) * 0.4,
        ),
      ),
    );
  }
}