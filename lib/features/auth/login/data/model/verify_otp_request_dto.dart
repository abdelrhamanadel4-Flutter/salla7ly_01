import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request_dto.g.dart';

@JsonSerializable()
class VerifyOtpRequestDto {
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'otpCode')
  final String? otpCode;

  VerifyOtpRequestDto({
    this.phone,
    this.otpCode,
  });

  factory VerifyOtpRequestDto.fromJson(Map<String, dynamic> json) => _$VerifyOtpRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyOtpRequestDtoToJson(this);
}