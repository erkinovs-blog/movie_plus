import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/ui/pages/splash/models/splash_entry.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/custom_splash_button.dart';

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
  ValueNotifier<bool> isLastPage = ValueNotifier(false);

  @override
  void initState() {
    widget.controller.addListener(changeButtons);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(changeButtons);
    super.dispose();
  }

  void changeButtons() {
    if (widget.controller.page?.ceil() == SplashEntry.entries.length - 1) {
      isLastPage.value = true;
    } else {
      isLastPage.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isLastPage,
        builder: (context, value, _) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: value
                ? Column(
                    children: [
                      const Spacer(flex: 1),
                      CustomSplashButton(
                        onPressed: () {},
                        text: "Sign up",
                      ),
                      const Spacer(flex: 1),
                      CustomSplashButton(
                        onPressed: () {},
                        text: "Log in",
                        isOutlined: true,
                      ),
                      const Spacer(flex: 6),
                    ],
                  )
                : Align(
                    alignment: const Alignment(0, 0.5),
                    child: CustomSplashButton(
                      onPressed: widget.onContinuePressed,
                      text: "Continue",
                    ),
                  ),
          );
        });
  }
}
