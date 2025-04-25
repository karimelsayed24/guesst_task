import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class PaymentPeriodDropdown extends StatelessWidget {
  const PaymentPeriodDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Per Month',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
