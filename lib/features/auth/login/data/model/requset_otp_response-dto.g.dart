// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requset_otp_response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequsetOtpResponseDto _$RequsetOtpResponseDtoFromJson(
  Map<String, dynamic> json,
) => RequsetOtpResponseDto(
  data: json['data'] == null
      ? null
      : DataDtoRequsetOtpResponse.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$RequsetOtpResponseDtoToJson(
  RequsetOtpResponseDto instance,
) => <String, dynamic>{'data': instance.data};

DataDtoRequsetOtpResponse _$DataDtoRequsetOtpResponseFromJson(
  Map<String, dynamic> json,
) => DataDtoRequsetOtpResponse(
  expiresAt: json['expiresAt'] as String?,
  devOtpCode: json['devOtpCode'] as String?,
);

Map<String, dynamic> _$DataDtoRequsetOtpResponseToJson(
  DataDtoRequsetOtpResponse instance,
) => <String, dynamic>{
  'expiresAt': instance.expiresAt,
  'devOtpCode': instance.devOtpCode,
};
