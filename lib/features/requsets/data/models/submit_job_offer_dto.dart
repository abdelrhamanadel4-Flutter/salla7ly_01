import 'package:json_annotation/json_annotation.dart';

part 'submit_job_offer_dto.g.dart';

@JsonSerializable()
class SubmitJobOfferDto {
  final num? consultationFee;

  SubmitJobOfferDto({this.consultationFee});

  factory SubmitJobOfferDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitJobOfferDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitJobOfferDtoToJson(this);
}

@JsonSerializable()
class SubmitJobOfferResponseDto {
  final SubmitJobOfferDataDto? data;

  SubmitJobOfferResponseDto({this.data});

  factory SubmitJobOfferResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitJobOfferResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitJobOfferResponseDtoToJson(this);
}

@JsonSerializable()
class SubmitJobOfferDataDto {
  final String? id;
  final String? status;
  final String? consultationFee;
  final String? submittedAt;

  SubmitJobOfferDataDto({
    this.id,
    this.status,
    this.consultationFee,
    this.submittedAt,
  });

  factory SubmitJobOfferDataDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitJobOfferDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitJobOfferDataDtoToJson(this);
}

