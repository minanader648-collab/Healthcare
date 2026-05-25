import 'package:flutter/material.dart';
import 'package:healthcare/core/widget/app_background.dart';
import 'package:healthcare/core/widget/colors_manager.dart';
import 'package:healthcare/core/widget/custom_button.dart';
import 'package:healthcare/features/on_boarding/model/onboarding_model.dart';
import 'package:healthcare/features/on_boarding/widgets/onboarding_item.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

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
                  itemCount: OnboardingModel.onboardingList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = OnboardingModel.onboardingList[index];
                    return OnboardingItem(
                      model: item,
                      currentIndex: _currentIndex,
                      itemCount: OnboardingModel.onboardingList.length,
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
                      if (_currentIndex < OnboardingModel.onboardingList.length - 1) {
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
