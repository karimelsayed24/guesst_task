import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../domain/models/filter.dart';
import 'radio_option.dart';

class JobLevelTab extends StatelessWidget {
  final JobLevel? jobLevel;
  final Function(JobLevel?) onJobLevelChanged;

  const JobLevelTab({
    super.key,
    required this.jobLevel,
    required this.onJobLevelChanged,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      height : 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF4e80c5)),
          ),
          child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Job Level',
          style: AppTextStyles.heading6,
        ),
        const SizedBox(height: 28),
        Column(
            children: [
              RadioOption<JobLevel>(
                value: JobLevel.trainee,
                groupValue: jobLevel,
                label: 'Trainee',
                onChanged: onJobLevelChanged,
              ),
              const SizedBox(height: 28),
              RadioOption<JobLevel>(
                value: JobLevel.junior,
                groupValue: jobLevel,
                label: 'Junior',
                onChanged: onJobLevelChanged,
              ),
              const SizedBox(height: 28),
              RadioOption<JobLevel>(
                value: JobLevel.senior,
                groupValue: jobLevel,
                label: 'Senior',
                onChanged: onJobLevelChanged,
              ),
            ],
          ),
        
      ],
    )
    );
  }
}
