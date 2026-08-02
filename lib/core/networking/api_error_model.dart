import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final ErrorResponse? error;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? statusCode;

  ApiErrorModel({
    this.error,
    this.statusCode,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

@JsonSerializable()
class ErrorResponse {
  final String? code;
  final String? message;
  final List<ErrorDetail>? details;

  ErrorResponse({
    this.code,
    this.message,
    this.details,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable()
class ErrorDetail {
  final String? field;
  final String? message;

  ErrorDetail({
    this.field,
    this.message,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailToJson(this);
}