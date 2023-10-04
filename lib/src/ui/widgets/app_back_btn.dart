import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';

class AppBackBtn extends StatelessWidget {
  const AppBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: BackButton(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.scaffoldBG.withOpacity(0.8),
        ),
        color: AppColors.white,
      ),
    );
  }
}
