import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/routes/app_routes.dart';
import 'package:movie_plus_app/src/ui/pages/splash/controllers/lang_bloc/lang_bloc.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/custom_splash_button.dart';
import 'package:movie_plus_app/src/ui/utils/screen_layout_resolver.dart';

class SplashLangSelector extends StatefulWidget {
  const SplashLangSelector({super.key});

  @override
  State<SplashLangSelector> createState() => _SplashLangSelectorState();
}

class _SplashLangSelectorState extends State<SplashLangSelector> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutResolver(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                const Spacer(flex: 3),
                BlocBuilder<LangBloc, LangState>(
                  builder: (context, state) {
                    return Column(
                      children: LangState.locales.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: CustomElevatedButton(
                            onPressed: () => context.read<LangBloc>().add(e.$2),
                            text: e.$1,
                            isOutlined: e.$2.locale !=
                                context.read<LangBloc>().currentLocale,
                          ),
                        );
                      }).toList(growable: false),
                    );
                  },
                ),
                const SizedBox(height: 30),
                FloatingActionButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRoutes.splash,
                  ),
                  backgroundColor: AppColors.red,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    color: AppColors.scaffoldBG,
                    size: 35,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
