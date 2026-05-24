import 'package:flutter/material.dart';
import 'package:healthcare/core/widget/app_background.dart';
import 'package:healthcare/features/splash/widgets/splash_logo.dart';
import 'package:healthcare/features/splash/widgets/splash_title.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(
        context,
        "/onboarding",
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppBackground(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [SplashLogo(), SizedBox(height: 16), SplashTitle()],
          ),
        ),
      ),
    );
  }
}
