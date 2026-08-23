import 'package:json_annotation/json_annotation.dart';

part 'publish_request_response_dto.g.dart';

@JsonSerializable()
class PublishRequestResponseDto {
  @JsonKey(name: 'data')
  final PublishRequestDataDto? data;

  PublishRequestResponseDto({
    this.data,
  });

  factory PublishRequestResponseDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PublishRequestResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PublishRequestResponseDtoToJson(this);
}

@JsonSerializable()
class PublishRequestDataDto {
  @JsonKey(name: 'request')
  final PublishRequestDto? request;

  @JsonKey(name: 'technicianCount')
  final int? technicianCount;

  PublishRequestDataDto({
    this.request,
    this.technicianCount,
  });

  factory PublishRequestDataDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PublishRequestDataDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PublishRequestDataDtoToJson(this);
}

@JsonSerializable()
class PublishRequestDto {
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
  final List<String?>? images;

  @JsonKey(name: 'aiEstimation')
  final PublishAiEstimationDto? aiEstimation;

  @JsonKey(name: 'technician')
  final PublishTechnicianDto? technician;

  @JsonKey(name: 'offersCount')
  final int? offersCount;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  PublishRequestDto({
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

  factory PublishRequestDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PublishRequestDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PublishRequestDtoToJson(this);
}

@JsonSerializable()
class PublishAiEstimationDto {
  @JsonKey(name: 'severity')
  final String? severity;

  @JsonKey(name: 'minPrice')
  final String? minPrice;

  @JsonKey(name: 'maxPrice')
  final String? maxPrice;

  @JsonKey(name: 'confidence')
  final String? confidence;

  PublishAiEstimationDto({
    this.severity,
    this.minPrice,
    this.maxPrice,
    this.confidence,
  });

  factory PublishAiEstimationDto.fromJson(
    Map<String, dynamic> json) =>
      _$PublishAiEstimationDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PublishAiEstimationDtoToJson(this);
}

@JsonSerializable()
class PublishTechnicianDto {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'fullName')
  final String? fullName;

  @JsonKey(name: 'phone')
  final String? phone;

  PublishTechnicianDto({
    this.id,
    this.fullName,
    this.phone,
  });

  factory PublishTechnicianDto.fromJson(
    Map<String, dynamic> json) =>
      _$PublishTechnicianDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PublishTechnicianDtoToJson(this);
}
