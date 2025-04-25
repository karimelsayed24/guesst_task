import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/job_card.dart';
import '../../domain/models/search_result.dart';

class SearchResultBody extends StatelessWidget {
  const SearchResultBody({
    super.key,
    required Future<SearchResult> searchFuture,
  }) : _searchFuture = searchFuture;

  final Future<SearchResult> _searchFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResult>(
      future: _searchFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final result = snapshot.data!;

        if (!result.hasResults) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sorry! Not found.',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Try searching with different keywords',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${result.totalCount.toStringAsFixed(0)} found',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: result.jobs.length,
                itemBuilder: (context, index) {
                  final job = result.jobs[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: JobCard(
                      job: job,
                      onSave: () {
                        // Handle save functionality
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
