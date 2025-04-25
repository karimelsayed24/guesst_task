import 'package:flutter/material.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/job_type_card.dart';
import 'experience_selection_screen.dart';

class JobTypeSelectionScreen extends StatefulWidget {
  const JobTypeSelectionScreen({super.key});

  @override
  State<JobTypeSelectionScreen> createState() => _JobTypeSelectionScreenState();
}

class _JobTypeSelectionScreenState extends State<JobTypeSelectionScreen> {
  String? _selectedJobType;

  void _handleContinue() {
    if (_selectedJobType != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ExperienceSelectionScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo
            Image.asset(
              AppAssets.logo,
              height: 80,
            ),
            const SizedBox(height: 40),

            // Title
            Text(
              'Choose your job type',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Subtitle
            Text(
              'Choose whether you looking for a job or you are a company looking for employee',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Job Type Cards
            Row(
              children: [
                Expanded(
                  child: JobTypeCard(
                    icon: Icons.business_center_outlined,
                    title: 'Find a job',
                    isSelected: _selectedJobType == 'job_seeker',
                    onTap: () {
                      setState(() {
                        _selectedJobType = 'job_seeker';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: JobTypeCard(
                    icon: Icons.person_outline,
                    title: 'Find an Employee',
                    isSelected: _selectedJobType == 'employer',
                    onTap: () {
                      setState(() {
                        _selectedJobType = 'employer';
                      });
                    },
                  ),
                ),
              ],
            ),
            const Spacer(),

            // Continue Button
            CustomButton(
              text: 'Continue',
              onPressed: _selectedJobType == null ? () {} : _handleContinue,
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}

