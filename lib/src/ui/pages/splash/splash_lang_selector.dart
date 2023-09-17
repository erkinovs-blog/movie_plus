import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/models/lang_model.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/custom_splash_button.dart';
import 'package:movie_plus_app/src/ui/utils/screen_layout_resolver.dart';
import 'package:provider/provider.dart';

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
            child: Consumer<LangModel>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    const Spacer(flex: 3),
                    CustomSplashButton(
                      onPressed: () => value.changeLang("uz"),
                      text: "O'zbekcha",
                      isOutlined: value.isEng,
                    ),
                    const SizedBox(height: 15),
                    CustomSplashButton(
                      onPressed: () => value.changeLang("en"),
                      text: "English",
                      isOutlined: !value.isEng,
                    ),
                    const SizedBox(height: 30),
                    child ?? const SizedBox.shrink(),
                    const Spacer(flex: 2),
                  ],
                );
              },
              child: FloatingActionButton(
                onPressed: () => Navigator.pushNamed(context, "/splash-page"),
                backgroundColor: AppColors.red,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Icon(Icons.chevron_right),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
