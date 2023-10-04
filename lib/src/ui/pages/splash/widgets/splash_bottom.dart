import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_plus_app/src/common/routes/app_routes.dart';
import 'package:movie_plus_app/src/ui/pages/splash/controllers/page_bloc/page_bloc.dart';
import 'package:movie_plus_app/src/ui/pages/splash/models/splash_entry.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/custom_splash_button.dart';
import 'package:movie_plus_app/src/ui/utils/functions.dart';

class SplashBottom extends StatefulWidget {
  const SplashBottom({
    super.key,
  });

  @override
  State<SplashBottom> createState() => _SplashBottomState();
}

class _SplashBottomState extends State<SplashBottom> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      buildWhen: (previous, current) =>
          current.currentPage >= SplashEntry.length - 2,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: state.currentPage == SplashEntry.length - 1
              ? Column(
                  children: [
                    const Spacer(flex: 1),
                    CustomElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        AppRoutes.signUp,
                      ),
                      text: translate(context).singUp,
                    ),
                    const Spacer(flex: 1),
                    CustomElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        AppRoutes.login,
                      ),
                      text: translate(context).login,
                      isOutlined: true,
                    ),
                    const Spacer(flex: 6),
                  ],
                )
              : Align(
                  alignment: const Alignment(0, 0.5),
                  child: CustomElevatedButton(
                    onPressed: context.read<PageBloc>().onContinuePressed,
                    text: translate(context).continueText,
                  ),
                ),
        );
      },
    );
  }
}
