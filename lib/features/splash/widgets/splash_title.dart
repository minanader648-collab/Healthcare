import 'package:flutter/material.dart';
import 'package:healthcare/core/widget/textstyle_manager.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Doctor Hunt', style: TextstyleManager.titleTextStyle);
  }
}
