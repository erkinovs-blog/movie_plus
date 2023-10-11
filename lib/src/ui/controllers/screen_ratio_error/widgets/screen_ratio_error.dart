import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';

class ScreenRatioError extends StatelessWidget {
  const ScreenRatioError({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Text(
          "Screen Ratio Error\n${size.width}x${size.height}",
          style: const TextStyle(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
