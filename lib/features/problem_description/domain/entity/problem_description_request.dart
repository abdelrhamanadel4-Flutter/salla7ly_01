class ProblemDescriptionRequest {
  final String? title;
  final String? description;
  final String? categoryId;
  final String? requestType;
  final List<String>? images;
  final String? serviceAddress;
  final String? serviceCity;
  final double? latitude;
  final double? longitude;

  ProblemDescriptionRequest({
    this.title,
    this.description,
    this.categoryId,
    this.requestType,
    this.images,
    this.serviceAddress,
    this.serviceCity,
    this.latitude,
    this.longitude,
  });
}