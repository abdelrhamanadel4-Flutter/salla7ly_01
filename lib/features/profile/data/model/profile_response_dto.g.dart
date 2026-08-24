// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseDto _$ProfileResponseDtoFromJson(Map<String, dynamic> json) =>
    ProfileResponseDto(
      data: json['data'] == null
          ? null
          : DataProfileResponseDto.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProfileResponseDtoToJson(ProfileResponseDto instance) =>
    <String, dynamic>{'data': instance.data};

DataProfileResponseDto _$DataProfileResponseDtoFromJson(
  Map<String, dynamic> json,
) => DataProfileResponseDto(
  user: json['user'] == null
      ? null
      : UserProfileResponseDto.fromJson(json['user'] as Map<String, dynamic>),
  technician: json['technicianProfile'] == null
      ? null
      : TechnicianProfileResponseDto.fromJson(
          json['technicianProfile'] as Map<String, dynamic>,
        ),
  accountState: json['accountState'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$DataProfileResponseDtoToJson(
  DataProfileResponseDto instance,
) => <String, dynamic>{
  'user': instance.user,
  'technicianProfile': instance.technician,
  'accountState': instance.accountState,
  'message': instance.message,
};

UserProfileResponseDto _$UserProfileResponseDtoFromJson(
  Map<String, dynamic> json,
) => UserProfileResponseDto(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  city: json['city'] as String?,
  address: json['address'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  profileImage: json['profileImage'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  pointsBalance: (json['pointsBalance'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserProfileResponseDtoToJson(
  UserProfileResponseDto instance,
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
  'profileImage': instance.profileImage,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'pointsBalance': instance.pointsBalance,
};

TechnicianProfileResponseDto _$TechnicianProfileResponseDtoFromJson(
  Map<String, dynamic> json,
) => TechnicianProfileResponseDto(
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

Map<String, dynamic> _$TechnicianProfileResponseDtoToJson(
  TechnicianProfileResponseDto instance,
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
