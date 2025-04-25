import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final double horizontalPadding;
  final double verticalPadding;

  const OnboardingButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.horizontalPadding = 100.0,
    this.verticalPadding = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        backgroundColor: isPrimary ? Color(0xFF27AAD8) : null,
        foregroundColor: isPrimary ? Colors.white : null,
      ),
      child: Text(text),
    );
  }
}
