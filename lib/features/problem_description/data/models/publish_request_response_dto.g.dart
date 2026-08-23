// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_request_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublishRequestResponseDto _$PublishRequestResponseDtoFromJson(
  Map<String, dynamic> json,
) => PublishRequestResponseDto(
  data: json['data'] == null
      ? null
      : PublishRequestDataDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PublishRequestResponseDtoToJson(
  PublishRequestResponseDto instance,
) => <String, dynamic>{'data': instance.data};

PublishRequestDataDto _$PublishRequestDataDtoFromJson(
  Map<String, dynamic> json,
) => PublishRequestDataDto(
  request: json['request'] == null
      ? null
      : PublishRequestDto.fromJson(json['request'] as Map<String, dynamic>),
  technicianCount: (json['technicianCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$PublishRequestDataDtoToJson(
  PublishRequestDataDto instance,
) => <String, dynamic>{
  'request': instance.request,
  'technicianCount': instance.technicianCount,
};

PublishRequestDto _$PublishRequestDtoFromJson(Map<String, dynamic> json) =>
    PublishRequestDto(
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
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      aiEstimation: json['aiEstimation'] == null
          ? null
          : PublishAiEstimationDto.fromJson(
              json['aiEstimation'] as Map<String, dynamic>,
            ),
      technician: json['technician'] == null
          ? null
          : PublishTechnicianDto.fromJson(
              json['technician'] as Map<String, dynamic>,
            ),
      offersCount: (json['offersCount'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$PublishRequestDtoToJson(PublishRequestDto instance) =>
    <String, dynamic>{
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

PublishAiEstimationDto _$PublishAiEstimationDtoFromJson(
  Map<String, dynamic> json,
) => PublishAiEstimationDto(
  severity: json['severity'] as String?,
  minPrice: json['minPrice'] as String?,
  maxPrice: json['maxPrice'] as String?,
  confidence: json['confidence'] as String?,
);

Map<String, dynamic> _$PublishAiEstimationDtoToJson(
  PublishAiEstimationDto instance,
) => <String, dynamic>{
  'severity': instance.severity,
  'minPrice': instance.minPrice,
  'maxPrice': instance.maxPrice,
  'confidence': instance.confidence,
};

PublishTechnicianDto _$PublishTechnicianDtoFromJson(
  Map<String, dynamic> json,
) => PublishTechnicianDto(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$PublishTechnicianDtoToJson(
  PublishTechnicianDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'phone': instance.phone,
};
