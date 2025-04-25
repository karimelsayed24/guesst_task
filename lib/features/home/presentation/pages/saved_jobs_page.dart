import 'package:flutter/material.dart';

import '../../domain/models/job.dart';
import '../widgets/job_card.dart';

class SavedJobsPage extends StatefulWidget {
  const SavedJobsPage({super.key});

  @override
  State<SavedJobsPage> createState() => _SavedJobsPageState();
}

class _SavedJobsPageState extends State<SavedJobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Saved Jobs'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: savedJobs.length,
        itemBuilder: (context, index) {
          final job = savedJobs[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: JobCard(
              job: job,
              onSave: () {
                setState(() {
                  // Update the saved status in the list
                  savedJobs[index] = job.copyWith(
                    isSaved: !job.isSaved,
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }
}
