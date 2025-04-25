import 'package:flutter/material.dart';

import '../../../auth/presentation/pages/login_screen.dart';
import '../../data/models/onboarding_page.dart';

class OnboardingController extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> pages = const [
    OnboardingPage(
      title: 'Find your talent With us',
      imagePath: 'assets/svg/onboarding1.svg',
      buttonText: 'Next',
    ),
    OnboardingPage(
      title: 'pursue your dream',
      imagePath: 'assets/svg/onboarding2.svg',
      buttonText: 'Next',
    ),
    OnboardingPage(
      title: 'let\'s go fishing',
      imagePath: 'assets/svg/onboarding3.svg',
      buttonText: 'Get started',
    ),
  ];

  int get currentPage => _currentPage;
  bool get isLastPage => _currentPage == pages.length - 1;

  void nextPage(BuildContext context) {
    if (_currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void onPageChanged(int page) {
    _currentPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
