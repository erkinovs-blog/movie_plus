import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/ui/pages/splash/controllers/controller_listener.dart';
import 'package:movie_plus_app/src/ui/pages/splash/models/splash_entry.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/animated_text.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/custom_shader.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/splash_bottom.dart';
import 'package:movie_plus_app/src/ui/utils/screen_layout_resolver.dart';
import 'package:movie_plus_app/src/ui/utils/screen_size_resolver.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final PageController controller;
  late ControllerListener controllerListener;

  void onContinuePressed() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    controller = PageController();
    controllerListener = ControllerListener(controller: controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutResolver(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: BackButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.scaffoldBG.withOpacity(0.8),
              ),
              color: AppColors.white,
            ),
          ),
        ),
        body: ChangeNotifierProvider<ControllerListener>.value(
          value: controllerListener,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: SizedBox(
                  height: AppScreen.height(context) * 0.7,
                  width: AppScreen.width(context),
                  child: CustomShader(
                    child: PageView.builder(
                      controller: controller,
                      itemCount: SplashEntry.length,
                      itemBuilder: (context, index) {
                        String image =
                            SplashEntry.entries(context).keys.elementAt(index);
                        return Image.asset(
                          image,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: AppScreen.height(context) * 0.55,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: SplashEntry.length,
                  effect: const WormEffect(
                    activeDotColor: AppColors.red,
                    dotColor: AppColors.white,
                    spacing: 10,
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
              ),
              Positioned(
                top: AppScreen.height(context) * 0.65,
                width: 270,
                child: SizedBox(
                  height: 115,
                  child: Center(
                    child: AnimatedText(controller: controller),
                  ),
                ),
              ),
              Positioned(
                height: AppScreen.height(context) * 0.35,
                width: AppScreen.width(context) * 0.8,
                bottom: 0,
                child: SizedBox.expand(
                  child: SplashBottom(
                    controller: controller,
                    onContinuePressed: onContinuePressed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
