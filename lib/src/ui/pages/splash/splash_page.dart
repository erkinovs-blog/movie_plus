import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.red,
    );
  }
}
