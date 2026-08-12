import 'package:json_annotation/json_annotation.dart';


part 'sign_up_responsedto.g.dart';

@JsonSerializable()
class SignUpResponsedto {
  @JsonKey(name: 'data')
  final DataDtoSignUpResponse? data;

  SignUpResponsedto({
    this.data,
  });

  factory SignUpResponsedto.fromJson(Map<String, dynamic> json) => _$SignUpResponsedtoFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponsedtoToJson(this);
}

@JsonSerializable()
class DataDtoSignUpResponse {
  @JsonKey(name: 'user')
  final UserDtoSignUpResponse? user;
  @JsonKey(name: 'technicianProfile')
  final TechnicianProfileDto? technicianProfile;
  @JsonKey(name: 'accountState')
  final String? accountState;
  @JsonKey(name: 'message')
  final String? message;

  DataDtoSignUpResponse({
    this.user,
    this.technicianProfile,
    this.accountState,
    this.message,
  });

  factory DataDtoSignUpResponse.fromJson(Map<String, dynamic> json) => _$DataDtoSignUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataDtoSignUpResponseToJson(this);
}

@JsonSerializable()
class TechnicianProfileDto {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'categoryId')
  final String? categoryId;
  @JsonKey(name: 'verificationStatus')
  final String? verificationStatus;
  @JsonKey(name: 'isAvailable')
  final bool? isAvailable;
  @JsonKey(name: 'overallRating')
  final String? overallRating;
  @JsonKey(name: 'totalReviews')
  final int? totalReviews;
  @JsonKey(name: 'profileImage')
  final String? profileImage;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  TechnicianProfileDto({
    this.id,
    this.userId,
    this.categoryId,
    this.verificationStatus,
    this.isAvailable,
    this.overallRating,
    this.totalReviews,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
  });

  factory TechnicianProfileDto.fromJson(Map<String, dynamic> json) => _$TechnicianProfileDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TechnicianProfileDtoToJson(this);
}

@JsonSerializable()
class UserDtoSignUpResponse {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'role')
  final String? role;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longitude')
  final double? longitude;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  UserDtoSignUpResponse({
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

  factory UserDtoSignUpResponse.fromJson(Map<String, dynamic> json) => _$UserDtoSignUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoSignUpResponseToJson(this);
}