import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class SalarySlider extends StatelessWidget {
  final double minSalary;
  final double maxSalary;
  final Function(double, double) onChanged;

  const SalarySlider({
    super.key,
    required this.minSalary,
    required this.maxSalary,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${minSalary.toInt()}k',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primary,
              ),
            ),
            Text(
              '\$${maxSalary.toInt()}k',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        RangeSlider(
          values: RangeValues(minSalary, maxSalary),
          min: 0,
          max: 20,
          divisions: 20,
          activeColor: AppColors.primary,
          inactiveColor: const Color(0xFFE0E0E0),
          onChanged: (values) {
            onChanged(values.start, values.end);
          },
        ),
      ],
    );
  }
}
