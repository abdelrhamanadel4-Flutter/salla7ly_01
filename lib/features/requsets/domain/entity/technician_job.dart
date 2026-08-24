class TechnicianJob {
  final String? id;
  final String? status;
  final String? createdAt;
  final JobRequest? request;
  final JobFee? fee;

  const TechnicianJob({
    this.id,
    this.status,
    this.createdAt,
    this.request,
    this.fee,
  });

  num? get suggestedFee => num.tryParse(fee?.suggested ?? '');
  num? get minFee => num.tryParse(fee?.min ?? '');
  num? get maxFee => num.tryParse(fee?.max ?? '');
}

class JobRequest {
  final String? id;
  final String? title;
  final String? description;
  final String? categoryName;
  final String? requestType;
  final List<String?>? images;
  final JobAiEstimation? aiEstimation;
  final JobCustomer? customer;

  const JobRequest({
    this.id,
    this.title,
    this.description,
    this.categoryName,
    this.requestType,
    this.images,
    this.aiEstimation,
    this.customer,
  });
}

class JobAiEstimation {
  final String? severity;
  final String? minPrice;
  final String? maxPrice;
  final String? confidence;

  const JobAiEstimation({
    this.severity,
    this.minPrice,
    this.maxPrice,
    this.confidence,
  });
}

class JobCustomer {
  final String? fullName;
  final String? city;
  final String? distanceKm;

  const JobCustomer({this.fullName, this.city, this.distanceKm});
}

class JobFee {
  final String? suggested;
  final String? min;
  final String? max;

  const JobFee({this.suggested, this.min, this.max});
}
