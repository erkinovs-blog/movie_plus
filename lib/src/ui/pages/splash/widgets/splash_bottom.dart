import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/ui/pages/splash/controllers/controller_listener.dart';
import 'package:movie_plus_app/src/ui/pages/splash/models/splash_entry.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/custom_splash_button.dart';
import 'package:movie_plus_app/src/ui/utils/functions.dart';
import 'package:provider/provider.dart';

class SplashBottom extends StatefulWidget {
  const SplashBottom({
    required this.onContinuePressed,
    required this.controller,
    super.key,
  });

  final VoidCallback onContinuePressed;
  final PageController controller;

  @override
  State<SplashBottom> createState() => _SplashBottomState();
}

class _SplashBottomState extends State<SplashBottom> {
  @override
  Widget build(BuildContext context) {
    return Selector<ControllerListener, int>(
      selector: (_, ControllerListener listener) => listener.selected,
      shouldRebuild: (previous, next) => next >= SplashEntry.length - 2,
      builder: (context, value, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: value == SplashEntry.length - 1
              ? Column(
                  children: [
                    const Spacer(flex: 1),
                    CustomSplashButton(
                      onPressed: () {},
                      text: translate(context).singUp,
                    ),
                    const Spacer(flex: 1),
                    CustomSplashButton(
                      onPressed: () {},
                      text: translate(context).login,
                      isOutlined: true,
                    ),
                    const Spacer(flex: 6),
                  ],
                )
              : Align(
                  alignment: const Alignment(0, 0.5),
                  child: CustomSplashButton(
                    onPressed: widget.onContinuePressed,
                    text: translate(context).continueText,
                  ),
                ),
        );
      },
    );
  }
}
