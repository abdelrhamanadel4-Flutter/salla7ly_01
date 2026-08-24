// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_job_offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitJobOfferDto _$SubmitJobOfferDtoFromJson(Map<String, dynamic> json) =>
    SubmitJobOfferDto(consultationFee: json['consultationFee'] as num?);

Map<String, dynamic> _$SubmitJobOfferDtoToJson(SubmitJobOfferDto instance) =>
    <String, dynamic>{'consultationFee': instance.consultationFee};

SubmitJobOfferResponseDto _$SubmitJobOfferResponseDtoFromJson(
  Map<String, dynamic> json,
) => SubmitJobOfferResponseDto(
  data: json['data'] == null
      ? null
      : SubmitJobOfferDataDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SubmitJobOfferResponseDtoToJson(
  SubmitJobOfferResponseDto instance,
) => <String, dynamic>{'data': instance.data};

SubmitJobOfferDataDto _$SubmitJobOfferDataDtoFromJson(
  Map<String, dynamic> json,
) => SubmitJobOfferDataDto(
  id: json['id'] as String?,
  status: json['status'] as String?,
  consultationFee: json['consultationFee'] as String?,
  submittedAt: json['submittedAt'] as String?,
);

Map<String, dynamic> _$SubmitJobOfferDataDtoToJson(
  SubmitJobOfferDataDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'consultationFee': instance.consultationFee,
  'submittedAt': instance.submittedAt,
};
