import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../domain/models/filter.dart';
import 'radio_option.dart';

class WorkTypeTab extends StatelessWidget {
  final WorkType? workType;
  final Function(WorkType?) onWorkTypeChanged;

  const WorkTypeTab({
    super.key,
    required this.workType,
    required this.onWorkTypeChanged,
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
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Work Type',
          style: AppTextStyles.heading6,
        ),
        const SizedBox(height: 28),
       Column(
            children: [
              RadioOption<WorkType>(
                value: WorkType.onside,
                groupValue: workType,
                label: 'Onside (Work from office)',
                onChanged: onWorkTypeChanged,
              ),
              const SizedBox(height: 28),
              RadioOption<WorkType>(
                value: WorkType.remotely,
                groupValue: workType,
                label: 'Remotely (Work from home)',
                onChanged: onWorkTypeChanged,
              ),
            ],
          ),
        
      ],
          )
    );
  }
}
