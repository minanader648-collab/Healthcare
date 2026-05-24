import 'package:flutter/material.dart';
import 'package:healthcare/core/widget/colors_manager.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 10.0,
          width: currentIndex == index ? 24.0 : 10.0,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? ColorsManager.buttonColor
                : const Color(0xFFC4C4C4),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
