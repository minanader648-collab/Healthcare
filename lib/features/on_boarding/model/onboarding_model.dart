class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: 'assets/images/onbor1.png',
      title: 'Find Trusted Doctors',
      subtitle:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
    ),
    OnboardingModel(
      image: 'assets/images/onbor2.png',
      title: 'Choose Best Doctors',
      subtitle:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
    ),
    OnboardingModel(
      image: 'assets/images/onbor3.png',
      title: 'Easy Appointments',
      subtitle:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
    ),
  ];
}
