class ProblemDescriptionResponse {
  final DataProblemDescriptionResponse? data;

  ProblemDescriptionResponse({this.data});
}

class DataProblemDescriptionResponse {
  final String? id;
  final String? categoryId;
  final String? categoryName;
  final String? requestType;
  final String? title;
  final String? description;
  final String? status;
  final String? serviceAddress;
  final String? serviceCity;
  final double? serviceLatitude;
  final double? serviceLongitude;
  final List<String>? images;
  final int? offersCount;

  DataProblemDescriptionResponse({
    this.id,
    this.categoryId,
    this.categoryName,
    this.requestType,
    this.title,
    this.description,
    this.status,
    this.serviceAddress,
    this.serviceCity,
    this.serviceLatitude,
    this.serviceLongitude,
    this.images,
    this.offersCount,
  });

}

