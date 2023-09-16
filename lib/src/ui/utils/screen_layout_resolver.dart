import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/ui/pages/screen_ratio_error/screen_ratio_error.dart';

class ScreenLayoutResolver extends StatelessWidget {
  const ScreenLayoutResolver({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 425) {
          return const ScreenRatioError();
        } else {
          return child;
        }
      },
    );
  }
}
