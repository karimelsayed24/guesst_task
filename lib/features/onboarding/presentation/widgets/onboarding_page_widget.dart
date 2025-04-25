import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/onboarding_page.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;
  final double horizontalPadding;
  final double verticalSpacing;

  const OnboardingPageWidget({
    super.key,
    required this.page,
    this.horizontalPadding = 24.0,
    this.verticalSpacing = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: verticalSpacing),
          Expanded(
            child: SvgPicture.asset(
              page.imagePath,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: verticalSpacing),
          Text(
            page.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
