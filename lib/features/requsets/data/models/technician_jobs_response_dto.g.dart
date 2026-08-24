// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician_jobs_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechnicianJobsResponseDto _$TechnicianJobsResponseDtoFromJson(
  Map<String, dynamic> json,
) => TechnicianJobsResponseDto(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => TechnicianJobDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : TechnicianJobsMetaDto.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TechnicianJobsResponseDtoToJson(
  TechnicianJobsResponseDto instance,
) => <String, dynamic>{'data': instance.data, 'meta': instance.meta};

TechnicianJobsMetaDto _$TechnicianJobsMetaDtoFromJson(
  Map<String, dynamic> json,
) => TechnicianJobsMetaDto(
  page: (json['page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
);

Map<String, dynamic> _$TechnicianJobsMetaDtoToJson(
  TechnicianJobsMetaDto instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'total': instance.total,
  'totalPages': instance.totalPages,
};

TechnicianJobDto _$TechnicianJobDtoFromJson(Map<String, dynamic> json) =>
    TechnicianJobDto(
      id: json['id'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      request: json['request'] == null
          ? null
          : JobRequestDto.fromJson(json['request'] as Map<String, dynamic>),
      fee: json['fee'] == null
          ? null
          : JobFeeDto.fromJson(json['fee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TechnicianJobDtoToJson(TechnicianJobDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'request': instance.request,
      'fee': instance.fee,
    };

JobRequestDto _$JobRequestDtoFromJson(Map<String, dynamic> json) =>
    JobRequestDto(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      categoryName: json['categoryName'] as String?,
      requestType: json['requestType'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      aiEstimation: json['aiEstimation'] == null
          ? null
          : JobAiEstimationDto.fromJson(
              json['aiEstimation'] as Map<String, dynamic>,
            ),
      customer: json['customer'] == null
          ? null
          : JobCustomerDto.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobRequestDtoToJson(JobRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'categoryName': instance.categoryName,
      'requestType': instance.requestType,
      'images': instance.images,
      'aiEstimation': instance.aiEstimation,
      'customer': instance.customer,
    };

JobAiEstimationDto _$JobAiEstimationDtoFromJson(Map<String, dynamic> json) =>
    JobAiEstimationDto(
      severity: json['severity'] as String?,
      minPrice: json['minPrice'] as String?,
      maxPrice: json['maxPrice'] as String?,
      confidence: json['confidence'] as String?,
    );

Map<String, dynamic> _$JobAiEstimationDtoToJson(JobAiEstimationDto instance) =>
    <String, dynamic>{
      'severity': instance.severity,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'confidence': instance.confidence,
    };

JobCustomerDto _$JobCustomerDtoFromJson(Map<String, dynamic> json) =>
    JobCustomerDto(
      fullName: json['fullName'] as String?,
      city: json['city'] as String?,
      distanceKm: json['distanceKm'] as String?,
    );

Map<String, dynamic> _$JobCustomerDtoToJson(JobCustomerDto instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'city': instance.city,
      'distanceKm': instance.distanceKm,
    };

JobFeeDto _$JobFeeDtoFromJson(Map<String, dynamic> json) => JobFeeDto(
  suggested: json['suggested'] as String?,
  min: json['min'] as String?,
  max: json['max'] as String?,
);

Map<String, dynamic> _$JobFeeDtoToJson(JobFeeDto instance) => <String, dynamic>{
  'suggested': instance.suggested,
  'min': instance.min,
  'max': instance.max,
};
