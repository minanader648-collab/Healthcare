import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  final Widget child;

  const SplashBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          // ── Top-left gradient blob ──
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF00C8A0).withOpacity(0.32),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── Bottom-right gradient blob ──
          Positioned(
            bottom: -60,
            right: -60,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color.fromARGB(255, 1, 161, 81).withOpacity(0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // ── Content ──
          Center(child: child),
        ],
      ),
    );
  }
}
