import 'package:flutter/material.dart';

abstract class AppScreen {
  static double height(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  static double width(BuildContext context) =>
      MediaQuery.sizeOf(context).width;
}
