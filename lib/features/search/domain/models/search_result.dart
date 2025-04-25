import '../../../home/domain/models/job.dart';

class SearchResult {
  final List<Job> jobs;
  final int totalCount;

  SearchResult({
    required this.jobs,
    required this.totalCount,
  });

  bool get hasResults => jobs.isNotEmpty;
}

class SearchRepository {
  Future<SearchResult> searchJobs(String query) async {
    // For demo purposes, return results only for UI/UX related queries
    final isUIUXQuery = query.toLowerCase().contains('ui') ||
        query.toLowerCase().contains('ui/ux');

    if (!isUIUXQuery) {
      return SearchResult(jobs: [], totalCount: 0);
    }

    // Return mock UI/UX jobs for demo
    final mockJobs = [
      Job(
        id: '1',
        title: 'UI/UX Designer',
        company: 'Google LLC',
        companyLogo: 'assets/svg/google_icon.svg',
        location: 'California, United States',
        salaryRange: '\$10,000 - \$30,000 /month',
        jobType: 'Part time',
      ),
      Job(
        id: '2',
        title: 'Senior UI Designer',
        company: 'Microsoft',
        companyLogo: 'assets/svg/google_icon.svg',
        location: 'New York, United States',
        salaryRange: '\$12,000 - \$35,000 /month',
        jobType: 'Full time',
      ),
      Job(
        id: '3',
        title: 'UX Researcher',
        company: 'Apple',
        companyLogo: 'assets/svg/google_icon.svg',
        location: 'California, United States',
        salaryRange: '\$15,000 - \$40,000 /month',
        jobType: 'Full time',
      ),
    ];

    return SearchResult(
      jobs: mockJobs,
      totalCount: 3487, // Mock total count
    );
  }
}
