import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';

class CustomShader extends StatelessWidget {
  const CustomShader({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.xor,
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            AppColors.transparent,
            AppColors.scaffoldBG,
          ],
          stops: [0, 0.9],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
