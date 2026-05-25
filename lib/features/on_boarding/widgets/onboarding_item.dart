import 'package:flutter/material.dart';
import 'package:healthcare/features/on_boarding/model/onboarding_model.dart';
import 'package:healthcare/features/on_boarding/widgets/onboarding_indicator.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;
  final int currentIndex;
  final int itemCount;

  const OnboardingItem({
    super.key,
    required this.model,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          // Circular cropped image matching the design
          Center(
            child: Container(
              width: screenWidth * 0.76,
              height: screenWidth * 0.76,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(model.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Page Indicator dots under the image
          OnboardingIndicator(
            currentIndex: currentIndex,
            itemCount: itemCount,
          ),
          const SizedBox(height: 40),
          // Onboarding Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              model.title,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          // Onboarding Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              model.subtitle,
              style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF677294),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
