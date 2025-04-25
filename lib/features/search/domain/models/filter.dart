enum WorkType {
  onside,
  remotely,
}

enum JobLevel {
  trainee,
  junior,
  senior,
}

enum PaymentPeriod {
  perMonth,
  perYear,
}

class FilterOptions {
  WorkType? workType;
  JobLevel? jobLevel;
  String? country;
  double? minSalary;
  double? maxSalary;
  PaymentPeriod paymentPeriod;

  FilterOptions({
    this.workType,
    this.jobLevel,
    this.country,
    this.minSalary,
    this.maxSalary,
    this.paymentPeriod = PaymentPeriod.perMonth,
  });

  FilterOptions copyWith({
    WorkType? workType,
    JobLevel? jobLevel,
    String? country,
    double? minSalary,
    double? maxSalary,
    PaymentPeriod? paymentPeriod,
  }) {
    return FilterOptions(
      workType: workType ?? this.workType,
      jobLevel: jobLevel ?? this.jobLevel,
      country: country ?? this.country,
      minSalary: minSalary ?? this.minSalary,
      maxSalary: maxSalary ?? this.maxSalary,
      paymentPeriod: paymentPeriod ?? this.paymentPeriod,
    );
  }
}
