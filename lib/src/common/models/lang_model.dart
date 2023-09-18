import 'package:flutter/material.dart';

class LangModel with ChangeNotifier {
  Locale current = const Locale("uz");

  void changeLang(String languageCode) {
    if (current != Locale(languageCode)) {
      current = Locale(languageCode);
      notifyListeners();
    }
  }
}
