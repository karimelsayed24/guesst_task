class Job {
  final String id;
  final String title;
  final String company;
  final String companyLogo;
  final String location;
  final String salaryRange;
  final String jobType;
  final bool isSaved;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.companyLogo,
    required this.location,
    required this.salaryRange,
    required this.jobType,
    this.isSaved = false,
  });

  Job copyWith({
    String? id,
    String? title,
    String? company,
    String? companyLogo,
    String? location,
    String? salaryRange,
    String? jobType,
    bool? isSaved,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      company: company ?? this.company,
      companyLogo: companyLogo ?? this.companyLogo,
      location: location ?? this.location,
      salaryRange: salaryRange ?? this.salaryRange,
      jobType: jobType ?? this.jobType,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
final List<Job> jobs = [
    Job(
      id: '1',
      title: 'UI/UX Designer',
      company: 'Google LLC',
      isSaved: false,
      companyLogo: 'assets/svg/google_icon.svg',
      location: 'California, United States',
      salaryRange: '\$10,000 - \$30,000 /month',
      jobType: 'Part time',
    ),
    Job(
      id: '1',
      title: 'UI/UX Designer',
      company: 'Google LLC',
      isSaved: true,
      companyLogo: 'assets/svg/google_icon.svg',
      location: 'California, United States',
      salaryRange: '\$10,000 - \$30,000 /month',
      jobType: 'Part time',
    ),
    Job(
      id: '1',
      title: 'UI/UX Designer',
      company: 'Google LLC',
      isSaved: false,
      companyLogo: 'assets/svg/google_icon.svg',
      location: 'California, United States',
      salaryRange: '\$10,000 - \$30,000 /month',
      jobType: 'Part time',
    ),
    // Add more jobs here
  ];

final List<Job> savedJobs = [
    Job(
      id: '1',
      title: 'UI/UX Designer',
      company: 'Google LLC',
      isSaved: true,
      companyLogo: 'assets/svg/google_icon.svg',
      location: 'California, United States',
      salaryRange: '\$10,000 - \$30,000 /month',
      jobType: 'Part time',
    ),
    Job(
      id: '1',
      title: 'UI/UX Designer',
      company: 'Google LLC',
      isSaved: true,
      companyLogo: 'assets/svg/google_icon.svg',
      location: 'California, United States',
      salaryRange: '\$10,000 - \$30,000 /month',
      jobType: 'Part time',
    ),

];
