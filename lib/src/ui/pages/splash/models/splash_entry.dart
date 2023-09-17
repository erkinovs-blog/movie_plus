import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_images.dart';
import 'package:movie_plus_app/src/ui/utils/functions.dart';

class SplashEntry {
  static Map<String, String> entries(BuildContext context) => {
        AppImages.img1: translate(context).img1Text,
        AppImages.img2: translate(context).img2Text,
        AppImages.img3: translate(context).img3Text,
        AppImages.img4: translate(context).img4Text,
        AppImages.img5: translate(context).img5Text,
        AppImages.img6: "",
      };

  static const length = 6;
}
