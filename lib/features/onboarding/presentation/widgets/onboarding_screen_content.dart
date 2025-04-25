import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/onboarding_page_widget.dart';
import '../widgets/page_indicator.dart';

class OnboardingScreenContent extends StatelessWidget {
  const OnboardingScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<OnboardingController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.pages.length,
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(
                    page: controller.pages[index],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: PageIndicator(
                currentPage: controller.currentPage,
                pageCount: controller.pages.length,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: OnboardingButton(
                text: controller.pages[controller.currentPage].buttonText,
                onPressed: () => controller.nextPage(context),
                isPrimary: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
