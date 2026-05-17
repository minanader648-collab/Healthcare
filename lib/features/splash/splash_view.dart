import 'package:flutter/material.dart';
import 'package:healthcare/features/splash/widgets/splash_background.dart';
import 'package:healthcare/features/splash/widgets/splash_logo.dart';
import 'package:healthcare/features/splash/widgets/splash_title.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBackground(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SplashLogo(),
            SizedBox(height: 16),
            SplashTitle(),
          ],
        ),
      ),
    );
  }
}
