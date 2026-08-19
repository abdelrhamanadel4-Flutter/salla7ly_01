// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_description_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemDescriptionResponseDto _$ProblemDescriptionResponseDtoFromJson(
  Map<String, dynamic> json,
) => ProblemDescriptionResponseDto(
  data: json['data'] == null
      ? null
      : DataProblemDescriptionResponseDto.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ProblemDescriptionResponseDtoToJson(
  ProblemDescriptionResponseDto instance,
) => <String, dynamic>{'data': instance.data};

DataProblemDescriptionResponseDto _$DataProblemDescriptionResponseDtoFromJson(
  Map<String, dynamic> json,
) => DataProblemDescriptionResponseDto(
  id: json['id'] as String?,
  customerId: json['customerId'] as String?,
  categoryId: json['categoryId'] as String?,
  categoryName: json['categoryName'] as String?,
  requestType: json['requestType'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  status: json['status'] as String?,
  serviceAddress: json['serviceAddress'] as String?,
  serviceCity: json['serviceCity'] as String?,
  serviceLatitude: (json['serviceLatitude'] as num?)?.toDouble(),
  serviceLongitude: (json['serviceLongitude'] as num?)?.toDouble(),
  distanceKm: json['distanceKm'] as String?,
  visitFee: json['visitFee'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  aiEstimation: json['aiEstimation'] == null
      ? null
      : AiEstimationDto.fromJson(json['aiEstimation'] as Map<String, dynamic>),
  technician: json['technician'] == null
      ? null
      : TechnicianDto.fromJson(json['technician'] as Map<String, dynamic>),
  offersCount: (json['offersCount'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$DataProblemDescriptionResponseDtoToJson(
  DataProblemDescriptionResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'customerId': instance.customerId,
  'categoryId': instance.categoryId,
  'categoryName': instance.categoryName,
  'requestType': instance.requestType,
  'title': instance.title,
  'description': instance.description,
  'status': instance.status,
  'serviceAddress': instance.serviceAddress,
  'serviceCity': instance.serviceCity,
  'serviceLatitude': instance.serviceLatitude,
  'serviceLongitude': instance.serviceLongitude,
  'distanceKm': instance.distanceKm,
  'visitFee': instance.visitFee,
  'images': instance.images,
  'aiEstimation': instance.aiEstimation,
  'technician': instance.technician,
  'offersCount': instance.offersCount,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

AiEstimationDto _$AiEstimationDtoFromJson(Map<String, dynamic> json) =>
    AiEstimationDto(
      severity: json['severity'] as String?,
      minPrice: json['minPrice'] as String?,
      maxPrice: json['maxPrice'] as String?,
      confidence: json['confidence'] as String?,
    );

Map<String, dynamic> _$AiEstimationDtoToJson(AiEstimationDto instance) =>
    <String, dynamic>{
      'severity': instance.severity,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'confidence': instance.confidence,
    };

TechnicianDto _$TechnicianDtoFromJson(Map<String, dynamic> json) =>
    TechnicianDto(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$TechnicianDtoToJson(TechnicianDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phone': instance.phone,
    };
