import 'package:flutter/material.dart';

class ControllerListener with ChangeNotifier {
  final PageController controller;
  int selected = 0;

  ControllerListener({
    required this.controller,
  }) {
    controller.addListener(controllerChanged);
  }

  void controllerChanged() {
    if (controller.page?.round() != selected) {
      selected = controller.page?.round() ?? 0;
      notifyListeners();
    }
  }
}
