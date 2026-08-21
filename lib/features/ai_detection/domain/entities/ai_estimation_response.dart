class AiEstimationResponse {
  final AiEstimation? estimation;
  final int? pointsCharged;
  final int? pointsBalance;

  AiEstimationResponse({
    this.estimation,
    this.pointsCharged,
    this.pointsBalance,
  });
}

class AiEstimation {
  final String? severity;
  final String? minPrice;
  final String? maxPrice;

  AiEstimation({
    this.severity,
    this.minPrice,
    this.maxPrice,
  });
}