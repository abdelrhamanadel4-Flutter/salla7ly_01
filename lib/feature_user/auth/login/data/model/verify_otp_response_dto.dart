import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_response_dto.g.dart';

@JsonSerializable()
class VerifyOtpResponseDto {
  @JsonKey(name: 'data')
  final DataDtoVerifyOtpResponse? data;

  VerifyOtpResponseDto({
    this.data,
  });

  factory VerifyOtpResponseDto.fromJson(Map<String, dynamic> json) => _$VerifyOtpResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyOtpResponseDtoToJson(this);
}

@JsonSerializable()
class DataDtoVerifyOtpResponse {
  @JsonKey(name: 'user')
  final UserDto? user;
  @JsonKey(name: 'isNewUser')
  final bool? isNewUser;
  @JsonKey(name: 'accountState')
  final String? accountState;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'tokens')
  final TokensDToVerifyOtpResponse? tokens;

  DataDtoVerifyOtpResponse({
    this.user,
    this.isNewUser,
    this.accountState,
    this.message,
    this.tokens,
  });

  factory DataDtoVerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$DataDtoVerifyOtpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataDtoVerifyOtpResponseToJson(this);
}

@JsonSerializable()
class TokensDToVerifyOtpResponse {
  @JsonKey(name: 'tokenType')
  final String? tokenType;
  @JsonKey(name: 'accessToken')
  final String? accessToken;
  @JsonKey(name: 'expiresIn')
  final int? expiresIn;
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;
  @JsonKey(name: 'refreshExpiresIn')
  final int? refreshExpiresIn;

  TokensDToVerifyOtpResponse({
    this.tokenType,
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
    this.refreshExpiresIn,
  });

  factory TokensDToVerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$TokensDToVerifyOtpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokensDToVerifyOtpResponseToJson(this);
}

@JsonSerializable()
class UserDto {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'fullName')
  final dynamic fullName;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'role')
  final String? role;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'city')
  final dynamic city;
  @JsonKey(name: 'address')
  final dynamic address;
  @JsonKey(name: 'latitude')
  final dynamic latitude;
  @JsonKey(name: 'longitude')
  final dynamic longitude;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  UserDto({
    this.id,
    this.fullName,
    this.phone,
    this.role,
    this.status,
    this.city,
    this.address,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}