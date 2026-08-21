import 'package:json_annotation/json_annotation.dart';

part 'problem_description_response_dto.g.dart';

@JsonSerializable()
class ProblemDescriptionResponseDto {
  @JsonKey(name: 'data')
  final DataProblemDescriptionResponseDto? data;

  ProblemDescriptionResponseDto({this.data});

  factory ProblemDescriptionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProblemDescriptionResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProblemDescriptionResponseDtoToJson(this);
}

@JsonSerializable()
class DataProblemDescriptionResponseDto {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'customerId')
  final String? customerId;
  @JsonKey(name: 'categoryId')
  final String? categoryId;
  @JsonKey(name: 'categoryName')
  final String? categoryName;
  @JsonKey(name: 'requestType')
  final String? requestType;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'serviceAddress')
  final String? serviceAddress;
  @JsonKey(name: 'serviceCity')
  final String? serviceCity;
  @JsonKey(name: 'serviceLatitude')
  final double? serviceLatitude;
  @JsonKey(name: 'serviceLongitude')
  final double? serviceLongitude;
  @JsonKey(name: 'distanceKm')
  final String? distanceKm;
  @JsonKey(name: 'visitFee')
  final String? visitFee;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'aiEstimation')
  final AiEstimationDto? aiEstimation;
  @JsonKey(name: 'technician')
  final TechnicianDto? technician;
  @JsonKey(name: 'offersCount')
  final int? offersCount;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  DataProblemDescriptionResponseDto({
    this.id,
    this.customerId,
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
    this.distanceKm,
    this.visitFee,
    this.images,
    this.aiEstimation,
    this.technician,
    this.offersCount,
    this.createdAt,
    this.updatedAt,
  });

  factory DataProblemDescriptionResponseDto.fromJson(
    Map<String, dynamic> json,
  ) => _$DataProblemDescriptionResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DataProblemDescriptionResponseDtoToJson(this);
}

@JsonSerializable()
class AiEstimationDto {
  @JsonKey(name: 'severity')
  final String? severity;
  @JsonKey(name: 'minPrice')
  final String? minPrice;
  @JsonKey(name: 'maxPrice')
  final String? maxPrice;
  @JsonKey(name: 'confidence')
  final String? confidence;

  AiEstimationDto({
    this.severity,
    this.minPrice,
    this.maxPrice,
    this.confidence,
  });

  factory AiEstimationDto.fromJson(Map<String, dynamic> json) =>
      _$AiEstimationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AiEstimationDtoToJson(this);
}

@JsonSerializable()
class TechnicianDto {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'phone')
  final String? phone;

  TechnicianDto({this.id, this.fullName, this.phone});

  factory TechnicianDto.fromJson(Map<String, dynamic> json) =>
      _$TechnicianDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianDtoToJson(this);
}
