import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.onPressed,
    required this.text,
    this.isOutlined = false,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        maximumSize: const Size.fromHeight(50),
        fixedSize: const Size.fromHeight(50),
        minimumSize: const Size.fromHeight(50),
        backgroundColor: isOutlined ? AppColors.scaffoldBG : AppColors.red,
        surfaceTintColor: AppColors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(
              color: AppColors.red,
              width: 3,
            )),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
