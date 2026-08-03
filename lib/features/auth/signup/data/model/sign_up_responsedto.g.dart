// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_responsedto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponsedto _$SignUpResponsedtoFromJson(Map<String, dynamic> json) =>
    SignUpResponsedto(
      data: json['data'] == null
          ? null
          : DataDtoSignUpResponse.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SignUpResponsedtoToJson(SignUpResponsedto instance) =>
    <String, dynamic>{'data': instance.data};

DataDtoSignUpResponse _$DataDtoSignUpResponseFromJson(
  Map<String, dynamic> json,
) => DataDtoSignUpResponse(
  user: json['user'] == null
      ? null
      : UserDtoSignUpResponse.fromJson(json['user'] as Map<String, dynamic>),
  technicianProfile: json['technicianProfile'] == null
      ? null
      : TechnicianProfileDto.fromJson(
          json['technicianProfile'] as Map<String, dynamic>,
        ),
  accountState: json['accountState'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$DataDtoSignUpResponseToJson(
  DataDtoSignUpResponse instance,
) => <String, dynamic>{
  'user': instance.user,
  'technicianProfile': instance.technicianProfile,
  'accountState': instance.accountState,
  'message': instance.message,
};

TechnicianProfileDto _$TechnicianProfileDtoFromJson(
  Map<String, dynamic> json,
) => TechnicianProfileDto(
  id: json['id'] as String?,
  userId: json['userId'] as String?,
  categoryId: json['categoryId'] as String?,
  verificationStatus: json['verificationStatus'] as String?,
  isAvailable: json['isAvailable'] as bool?,
  overallRating: json['overallRating'] as String?,
  totalReviews: (json['totalReviews'] as num?)?.toInt(),
  profileImage: json['profileImage'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$TechnicianProfileDtoToJson(
  TechnicianProfileDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'categoryId': instance.categoryId,
  'verificationStatus': instance.verificationStatus,
  'isAvailable': instance.isAvailable,
  'overallRating': instance.overallRating,
  'totalReviews': instance.totalReviews,
  'profileImage': instance.profileImage,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

UserDtoSignUpResponse _$UserDtoSignUpResponseFromJson(
  Map<String, dynamic> json,
) => UserDtoSignUpResponse(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  city: json['city'] as String?,
  address: json['address'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$UserDtoSignUpResponseToJson(
  UserDtoSignUpResponse instance,
) => <String, dynamic>{
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
