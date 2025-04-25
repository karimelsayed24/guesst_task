import 'package:flutter/material.dart';

import '../../../home/domain/models/job.dart';
import '../../../home/presentation/widgets/job_card.dart';

class SavedJobsPage extends StatelessWidget {
  const SavedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          AppBar(
            centerTitle: true,
            title: const Text('Saved Jobs'),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = savedJobs[index];
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
