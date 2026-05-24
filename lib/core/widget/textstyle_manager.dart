import 'package:flutter/material.dart';
import 'package:healthcare/core/widget/colors_manager.dart';

class TextstyleManager {
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: ColorsManager.blackColor,
    letterSpacing: 0.5,
  );
  static const TextStyle bottomTextStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: ColorsManager.whiteColor,
    letterSpacing: 0.5,
  );
}
