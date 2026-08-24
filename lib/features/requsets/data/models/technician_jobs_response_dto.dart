import 'package:json_annotation/json_annotation.dart';

part 'technician_jobs_response_dto.g.dart';

@JsonSerializable()
class TechnicianJobsResponseDto {
  final List<TechnicianJobDto>? data;
  final TechnicianJobsMetaDto? meta;

  TechnicianJobsResponseDto({this.data, this.meta});

  factory TechnicianJobsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TechnicianJobsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianJobsResponseDtoToJson(this);
}

@JsonSerializable()
class TechnicianJobsMetaDto {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPages;

  TechnicianJobsMetaDto({this.page, this.limit, this.total, this.totalPages});

  factory TechnicianJobsMetaDto.fromJson(Map<String, dynamic> json) =>
      _$TechnicianJobsMetaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianJobsMetaDtoToJson(this);
}

@JsonSerializable()
class TechnicianJobDto {
  final String? id;
  final String? status;
  final String? createdAt;
  final JobRequestDto? request;
  final JobFeeDto? fee;

  TechnicianJobDto({
    this.id,
    this.status,
    this.createdAt,
    this.request,
    this.fee,
  });

  factory TechnicianJobDto.fromJson(Map<String, dynamic> json) =>
      _$TechnicianJobDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianJobDtoToJson(this);
}

@JsonSerializable()
class JobRequestDto {
  final String? id;
  final String? title;
  final String? description;
  final String? categoryName;
  final String? requestType;
  final List<String?>? images;
  final JobAiEstimationDto? aiEstimation;
  final JobCustomerDto? customer;

  JobRequestDto({
    this.id,
    this.title,
    this.description,
    this.categoryName,
    this.requestType,
    this.images,
    this.aiEstimation,
    this.customer,
  });

  factory JobRequestDto.fromJson(Map<String, dynamic> json) =>
      _$JobRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobRequestDtoToJson(this);
}

@JsonSerializable()
class JobAiEstimationDto {
  final String? severity;
  final String? minPrice;
  final String? maxPrice;
  final String? confidence;

  JobAiEstimationDto({
    this.severity,
    this.minPrice,
    this.maxPrice,
    this.confidence,
  });

  factory JobAiEstimationDto.fromJson(Map<String, dynamic> json) =>
      _$JobAiEstimationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobAiEstimationDtoToJson(this);
}

@JsonSerializable()
class JobCustomerDto {
  final String? fullName;
  final String? city;
  final String? distanceKm;

  JobCustomerDto({this.fullName, this.city, this.distanceKm});

  factory JobCustomerDto.fromJson(Map<String, dynamic> json) =>
      _$JobCustomerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobCustomerDtoToJson(this);
}

@JsonSerializable()
class JobFeeDto {
  final String? suggested;
  final String? min;
  final String? max;

  JobFeeDto({this.suggested, this.min, this.max});

  factory JobFeeDto.fromJson(Map<String, dynamic> json) =>
      _$JobFeeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobFeeDtoToJson(this);
}
