import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/ui/pages/splash/controllers/page_bloc/page_bloc.dart';
import 'package:movie_plus_app/src/ui/pages/splash/models/splash_entry.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        String selectedText =
            SplashEntry.entries(context).values.elementAt(state.currentPage);
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
