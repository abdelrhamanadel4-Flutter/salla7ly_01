// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersResponseDto _$OffersResponseDtoFromJson(Map<String, dynamic> json) =>
    OffersResponseDto(
      data: json['data'] == null
          ? null
          : OffersDataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OffersResponseDtoToJson(OffersResponseDto instance) =>
    <String, dynamic>{'data': instance.data};

OffersDataDto _$OffersDataDtoFromJson(Map<String, dynamic> json) =>
    OffersDataDto(
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => OfferDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OffersDataDtoToJson(OffersDataDto instance) =>
    <String, dynamic>{'offers': instance.offers};

OfferDto _$OfferDtoFromJson(Map<String, dynamic> json) => OfferDto(
  id: json['id'] as String?,
  requestId: json['requestId'] as String?,
  price: json['price'] as num?,
  consultationFee: json['consultationFee'] as num?,
  status: json['status'] as String?,
  createdAt: json['createdAt'] as String?,
  technician: json['technician'] == null
      ? null
      : OfferTechnicianDto.fromJson(json['technician'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OfferDtoToJson(OfferDto instance) => <String, dynamic>{
  'id': instance.id,
  'requestId': instance.requestId,
  'price': instance.price,
  'consultationFee': instance.consultationFee,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'technician': instance.technician,
};

OfferTechnicianDto _$OfferTechnicianDtoFromJson(Map<String, dynamic> json) =>
    OfferTechnicianDto(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
      categoryName: json['categoryName'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      overallRating: (json['overallRating'] as num?)?.toDouble(),
      totalReviews: (json['totalReviews'] as num?)?.toInt(),
      profileImage: json['profileImage'] as String?,
      distanceKm: json['distanceKm'] as num?,
    );

Map<String, dynamic> _$OfferTechnicianDtoToJson(OfferTechnicianDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'categoryName': instance.categoryName,
      'city': instance.city,
      'address': instance.address,
      'overallRating': instance.overallRating,
      'totalReviews': instance.totalReviews,
      'profileImage': instance.profileImage,
      'distanceKm': instance.distanceKm,
    };
