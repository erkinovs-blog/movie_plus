import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/ui/pages/splash/controllers/controller_listener.dart';
import 'package:movie_plus_app/src/ui/pages/splash/models/splash_entry.dart';
import 'package:provider/provider.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({
    required this.controller,
    super.key,
  });

  final PageController controller;

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  @override
  Widget build(BuildContext context) {
    return Selector<ControllerListener, int>(
      selector: (_, ControllerListener listener) => listener.selected,
      builder: (context, value, child) {
        String selectedText =
            SplashEntry.entries(context).values.elementAt(value);
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            selectedText,
            key: ValueKey(selectedText),
            textAlign: TextAlign.center,
            maxLines: 4,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
