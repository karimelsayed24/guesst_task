import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import 'country_field.dart';
import 'payment_period_dropdown.dart';
import 'salary_slider.dart';

class LocationSalaryTab extends StatelessWidget {
  final double? minSalary;
  final double? maxSalary;
  final Function(double, double) onSalaryChanged;

  const LocationSalaryTab({
    super.key,
    required this.minSalary,
    required this.maxSalary,
    required this.onSalaryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF4e80c5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Location & Salary',
              style: AppTextStyles.heading6,
            ),
            const SizedBox(height: 28),
            Column(
              children: [
                const CountryField(),
                const SizedBox(height: 20),
                SalarySlider(
                  minSalary: minSalary ?? 5,
                  maxSalary: maxSalary ?? 10,
                  onChanged: onSalaryChanged,
                ),
                const SizedBox(height: 20),
                const PaymentPeriodDropdown(),
              ],
            ),
          ],
        ));
  }
}
