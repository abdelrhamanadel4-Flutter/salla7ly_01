import 'package:json_annotation/json_annotation.dart';

part 'profile_response_dto.g.dart';

@JsonSerializable()
class ProfileResponseDto {
  @JsonKey(name: 'data')
  final DataProfileResponseDto? data;

  ProfileResponseDto({this.data});

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseDtoToJson(this);
}

@JsonSerializable()
class DataProfileResponseDto {
  @JsonKey(name: 'user')
  final UserProfileResponseDto? user;
  @JsonKey(name: 'technicianProfile')
  final TechnicianProfileResponseDto? technician;
  @JsonKey(name: 'accountState')
  final String? accountState;
  @JsonKey(name: 'message')
  final String? message;

  DataProfileResponseDto({
    this.user,
    this.technician,
    this.accountState,
    this.message,
  });

  factory DataProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DataProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataProfileResponseDtoToJson(this);
}

@JsonSerializable()
class UserProfileResponseDto {
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
  @JsonKey(name: 'profileImage')
  final String? profileImage;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: 'pointsBalance')
  final int? pointsBalance;

  UserProfileResponseDto({
    this.id,
    this.fullName,
    this.phone,
    this.role,
    this.status,
    this.city,
    this.address,
    this.latitude,
    this.longitude,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.pointsBalance,
  });

  factory UserProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseDtoToJson(this);
}

@JsonSerializable()
class TechnicianProfileResponseDto {
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

  TechnicianProfileResponseDto({
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

  factory TechnicianProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TechnicianProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianProfileResponseDtoToJson(this);
}

//customer
// {
//     "data": {
//         "user": {
//             "id": "82",
//             "fullName": "abdelrhman",
//             "phone": "+201202239812",
//             "role": "CUSTOMER",
//             "status": "ACTIVE",
//             "city": "California",
//             "address": "1600, 1600 Amphitheatre Pkwy, Mountain View",
//             "latitude": 37.4219983,
//             "longitude": -122.084,
//             "createdAt": "2026-08-11T15:29:11.060Z",
//             "updatedAt": "2026-08-11T15:29:53.965Z",
//             "pointsBalance": 0
//         },
//         "technicianProfile": null,
//         "accountState": "READY",
//         "message": "حسابك جاهز"
//     }
// }

// technician
// {
//     "data": {
//         "user": {
//             "id": "37",
//             "fullName": "تجربه",
//             "phone": "+201000000003",
//             "role": "TECHNICIAN",
//             "status": "PENDING",
//             "city": "الاسكندريه",
//             "address": "فلمنج",
//             "latitude": 31.22957159,
//             "longitude": 29.97318063,
//             "createdAt": "2026-08-05T00:22:09.280Z",
//             "updatedAt": "2026-08-05T00:27:16.104Z",
//             "pointsBalance": 0
//         },
//         "technicianProfile": {
//             "id": "9",
//             "userId": "37",
//             "categoryId": "2",
//             "verificationStatus": "PENDING",
//             "isAvailable": true,
//             "overallRating": "0",
//             "totalReviews": 0,
//             "profileImage": "/uploads/1785889636091-411dce2b-1ab1-415f-959c-4d4adfa380e6.png",
//             "createdAt": "2026-08-05T00:27:16.109Z",
//             "updatedAt": "2026-08-05T00:27:16.109Z"
//         },
//         "accountState": "WAITING_FOR_APPROVAL",
//         "message": "مستنداتك تحت المراجعة. هنبعتلك إشعار أول ما الأدمن يوافق على حسابك."
//     }
// }
