// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpRequestDto _$VerifyOtpRequestDtoFromJson(Map<String, dynamic> json) =>
    VerifyOtpRequestDto(
      phone: json['phone'] as String?,
      otpCode: json['otpCode'] as String?,
    );

Map<String, dynamic> _$VerifyOtpRequestDtoToJson(
  VerifyOtpRequestDto instance,
) => <String, dynamic>{'phone': instance.phone, 'otpCode': instance.otpCode};
