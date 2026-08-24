import 'package:json_annotation/json_annotation.dart';

part 'offers_response_dto.g.dart';

@JsonSerializable()
class OffersResponseDto {
  @JsonKey(name: 'data')
  final OffersDataDto? data;

  OffersResponseDto({this.data});

  factory OffersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OffersResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OffersResponseDtoToJson(this);
}

@JsonSerializable()
class OffersDataDto {
  @JsonKey(name: 'offers')
  final List<OfferDto>? offers;

  OffersDataDto({this.offers});

  factory OffersDataDto.fromJson(Map<String, dynamic> json) =>
      _$OffersDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OffersDataDtoToJson(this);
}

@JsonSerializable()
class OfferDto {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'requestId')
  final String? requestId;

  @JsonKey(name: 'price')
  final num? price;

  @JsonKey(name: 'consultationFee')
  final num? consultationFee;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'technician')
  final OfferTechnicianDto? technician;

  OfferDto({
    this.id,
    this.requestId,
    this.price,
    this.consultationFee,
    this.status,
    this.createdAt,
    this.technician,
  });

  factory OfferDto.fromJson(Map<String, dynamic> json) =>
      _$OfferDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OfferDtoToJson(this);
}

@JsonSerializable()
class OfferTechnicianDto {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'fullName')
  final String? fullName;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'categoryName')
  final String? categoryName;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'overallRating')
  final double? overallRating;

  @JsonKey(name: 'totalReviews')
  final int? totalReviews;

  @JsonKey(name: 'profileImage')
  final String? profileImage;

  @JsonKey(name: 'distanceKm')
  final num? distanceKm;

  OfferTechnicianDto({
    this.id,
    this.fullName,
    this.phone,
    this.categoryName,
    this.city,
    this.address,
    this.overallRating,
    this.totalReviews,
    this.profileImage,
    this.distanceKm,
  });

  factory OfferTechnicianDto.fromJson(Map<String, dynamic> json) =>
      _$OfferTechnicianDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OfferTechnicianDtoToJson(this);
}
