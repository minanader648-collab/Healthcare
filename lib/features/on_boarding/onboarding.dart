import 'package:flutter/material.dart';
import 'package:healthcare/core/widget/app_background.dart';
import 'package:healthcare/core/widget/colors_manager.dart';
import 'package:healthcare/core/widget/custom_button.dart';
import 'package:healthcare/features/on_boarding/widgets/onboarding_item.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/onbor1.png',
      'title': 'Find Trusted Doctors',
      'subtitle':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
    },
    {
      'image': 'assets/images/onbor2.png',
      'title': 'Choose Best Doctors',
      'subtitle':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
    },
    {
      'image': 'assets/images/onbor3.png',
      'title': 'Easy Appointments',
      'subtitle':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        topLeftColor: ColorsManager.buttonColor, // اللون الأخضر الخاص بالتطبيق
        topLeftOpacity: 1.0,                     // بدون أي شفافية
        topLeftSolid: true,                      // جعل الدائرة مصمتة ذات حواف حادة كما في الصورة
        bottomRightColor: ColorsManager.buttonColor,
        bottomRightOpacity: 0.12,                // تدرج خفيف في اليمين بالأسفل
        child: SafeArea(
          child: Column(
            children: [
              // الجزء المتغير (الصورة والبيانات والنقاط)
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = _onboardingData[index];
                    return OnboardingItem(
                      imagePath: item['image']!,
                      title: item['title']!,
                      subtitle: item['subtitle']!,
                      currentIndex: _currentIndex,
                      itemCount: _onboardingData.length,
                    );
                  },
                ),
              ),

              // الجزء الثابت في الأسفل (الأزرار)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    text: 'Get Started',
                    onPressed: () {
                      if (_currentIndex < _onboardingData.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        // عند الوصول لآخر صفحة (يمكنك التوجيه لصفحة تسجيل الدخول أو الرئيسية لاحقاً)
                        debugPrint("Onboarding Completed!");
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // تخطي الـ Onboarding
                      debugPrint("Onboarding Skipped!");
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF677294),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
