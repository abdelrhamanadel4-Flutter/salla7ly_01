import 'package:json_annotation/json_annotation.dart';

part 'accept_offer_response_dto.g.dart';

@JsonSerializable()
class AcceptOfferResponseDto {
  @JsonKey(name: 'data')
  final AcceptOfferDataDto? data;

  AcceptOfferResponseDto({this.data});

  factory AcceptOfferResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AcceptOfferResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptOfferResponseDtoToJson(this);
}

@JsonSerializable()
class AcceptOfferDataDto {
  @JsonKey(name: 'request')
  final AcceptOfferRequestDto? request;

  @JsonKey(name: 'technician')
  final AcceptOfferTechnicianDto? technician;

  AcceptOfferDataDto({this.request, this.technician});

  factory AcceptOfferDataDto.fromJson(Map<String, dynamic> json) =>
      _$AcceptOfferDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptOfferDataDtoToJson(this);
}

@JsonSerializable()
class AcceptOfferRequestDto {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'status')
  final String? status;

  AcceptOfferRequestDto({this.id, this.status});

  factory AcceptOfferRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AcceptOfferRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptOfferRequestDtoToJson(this);
}

@JsonSerializable()
class AcceptOfferTechnicianDto {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'fullName')
  final String? fullName;

  @JsonKey(name: 'phone')
  final String? phone;

  AcceptOfferTechnicianDto({this.id, this.fullName, this.phone});

  factory AcceptOfferTechnicianDto.fromJson(Map<String, dynamic> json) =>
      _$AcceptOfferTechnicianDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptOfferTechnicianDtoToJson(this);
}
