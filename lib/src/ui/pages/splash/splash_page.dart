import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/ui/controllers/screen_ratio_error/screen_layout_resolver.dart';
import 'package:movie_plus_app/src/ui/pages/splash/controllers/page_bloc/page_bloc.dart';
import 'package:movie_plus_app/src/ui/pages/splash/models/splash_entry.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/animated_text.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/custom_shader.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/splash_bottom.dart';
import 'package:movie_plus_app/src/ui/utils/screen_size_resolver.dart';
import 'package:movie_plus_app/src/ui/widgets/app_back_btn.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutResolver(
      child: BlocProvider(
        create: (context) => PageBloc(),
        child: Builder(builder: (context) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              forceMaterialTransparency: true,
              leading: const AppBackBtn(),
            ),
            body: Stack(
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
                        controller: context.read<PageBloc>().controller,
                        itemCount: SplashEntry.length,
                        itemBuilder: (context, index) {
                          String image = SplashEntry.entries(context)
                              .keys
                              .elementAt(index);
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
                    controller: context.read<PageBloc>().controller,
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
                  child: const SizedBox(
                    height: 115,
                    child: Center(
                      child: AnimatedText(),
                    ),
                  ),
                ),
                Positioned(
                  height: AppScreen.height(context) * 0.35,
                  width: AppScreen.width(context) * 0.8,
                  bottom: 0,
                  child: const SizedBox.expand(
                    child: SplashBottom(),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
