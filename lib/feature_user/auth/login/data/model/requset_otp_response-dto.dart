import 'package:json_annotation/json_annotation.dart';

part 'requset_otp_response-dto.g.dart';

@JsonSerializable()
class RequsetOtpResponseDto {
  @JsonKey(name: 'data')
  final DataDtoRequsetOtpResponse? data;

  RequsetOtpResponseDto({
    this.data,
  });

  factory RequsetOtpResponseDto.fromJson(Map<String, dynamic> json) => _$RequsetOtpResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RequsetOtpResponseDtoToJson(this);
}

@JsonSerializable()
class DataDtoRequsetOtpResponse {
  @JsonKey(name: 'expiresAt')
  final String? expiresAt;
  @JsonKey(name: 'devOtpCode')
  final String? devOtpCode;

  DataDtoRequsetOtpResponse({
    this.expiresAt,
    this.devOtpCode,
  });

  factory DataDtoRequsetOtpResponse.fromJson(Map<String, dynamic> json) => _$DataDtoRequsetOtpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataDtoRequsetOtpResponseToJson(this);
}