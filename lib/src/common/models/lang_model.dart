import 'package:flutter/material.dart';

class LangModel with ChangeNotifier {
  Locale current = const Locale("en");

  void changeLang(String languageCode) {
    if (current != Locale(languageCode)) {
      current = Locale(languageCode);
      notifyListeners();
    }
  }
}
