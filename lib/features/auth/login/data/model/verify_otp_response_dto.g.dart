// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponseDto _$VerifyOtpResponseDtoFromJson(
  Map<String, dynamic> json,
) => VerifyOtpResponseDto(
  data: json['data'] == null
      ? null
      : DataDtoVerifyOtpResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerifyOtpResponseDtoToJson(
  VerifyOtpResponseDto instance,
) => <String, dynamic>{'data': instance.data};

DataDtoVerifyOtpResponse _$DataDtoVerifyOtpResponseFromJson(
  Map<String, dynamic> json,
) => DataDtoVerifyOtpResponse(
  user: json['user'] == null
      ? null
      : UserDto.fromJson(json['user'] as Map<String, dynamic>),
  isNewUser: json['isNewUser'] as bool?,
  accountState: json['accountState'] as String?,
  message: json['message'] as String?,
  tokens: json['tokens'] == null
      ? null
      : TokensDToVerifyOtpResponse.fromJson(
          json['tokens'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$DataDtoVerifyOtpResponseToJson(
  DataDtoVerifyOtpResponse instance,
) => <String, dynamic>{
  'user': instance.user,
  'isNewUser': instance.isNewUser,
  'accountState': instance.accountState,
  'message': instance.message,
  'tokens': instance.tokens,
};

TokensDToVerifyOtpResponse _$TokensDToVerifyOtpResponseFromJson(
  Map<String, dynamic> json,
) => TokensDToVerifyOtpResponse(
  tokenType: json['tokenType'] as String?,
  accessToken: json['accessToken'] as String?,
  expiresIn: (json['expiresIn'] as num?)?.toInt(),
  refreshToken: json['refreshToken'] as String?,
  refreshExpiresIn: (json['refreshExpiresIn'] as num?)?.toInt(),
);

Map<String, dynamic> _$TokensDToVerifyOtpResponseToJson(
  TokensDToVerifyOtpResponse instance,
) => <String, dynamic>{
  'tokenType': instance.tokenType,
  'accessToken': instance.accessToken,
  'expiresIn': instance.expiresIn,
  'refreshToken': instance.refreshToken,
  'refreshExpiresIn': instance.refreshExpiresIn,
};

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  id: json['id'] as String?,
  fullName: json['fullName'],
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  city: json['city'],
  address: json['address'],
  latitude: json['latitude'],
  longitude: json['longitude'],
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'phone': instance.phone,
  'role': instance.role,
  'status': instance.status,
  'city': instance.city,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
