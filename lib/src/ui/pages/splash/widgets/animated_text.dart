import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/ui/pages/splash/models/splash_entry.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  int selected = 0;

  @override
  void initState() {
    widget.controller.addListener(changeText);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(changeText);
    super.dispose();
  }

  void changeText() {
    if (widget.controller.page?.floor() != selected) {
      setState(() {
        selected = widget.controller.page?.floor() ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedText = SplashEntry.entries.values.elementAt(selected);
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
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
