import 'package:flutter/material.dart';

import '../../domain/models/job.dart';
import '../widgets/job_card.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 16),
          AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text('Recommendation'),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: JobCard(
                    job: job,
                    onSave: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
