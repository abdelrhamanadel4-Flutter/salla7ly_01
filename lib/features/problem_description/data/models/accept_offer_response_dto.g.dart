// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_offer_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptOfferResponseDto _$AcceptOfferResponseDtoFromJson(
  Map<String, dynamic> json,
) => AcceptOfferResponseDto(
  data: json['data'] == null
      ? null
      : AcceptOfferDataDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AcceptOfferResponseDtoToJson(
  AcceptOfferResponseDto instance,
) => <String, dynamic>{'data': instance.data};

AcceptOfferDataDto _$AcceptOfferDataDtoFromJson(Map<String, dynamic> json) =>
    AcceptOfferDataDto(
      request: json['request'] == null
          ? null
          : AcceptOfferRequestDto.fromJson(
              json['request'] as Map<String, dynamic>,
            ),
      technician: json['technician'] == null
          ? null
          : AcceptOfferTechnicianDto.fromJson(
              json['technician'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AcceptOfferDataDtoToJson(AcceptOfferDataDto instance) =>
    <String, dynamic>{
      'request': instance.request,
      'technician': instance.technician,
    };

AcceptOfferRequestDto _$AcceptOfferRequestDtoFromJson(
  Map<String, dynamic> json,
) => AcceptOfferRequestDto(
  id: json['id'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$AcceptOfferRequestDtoToJson(
  AcceptOfferRequestDto instance,
) => <String, dynamic>{'id': instance.id, 'status': instance.status};

AcceptOfferTechnicianDto _$AcceptOfferTechnicianDtoFromJson(
  Map<String, dynamic> json,
) => AcceptOfferTechnicianDto(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$AcceptOfferTechnicianDtoToJson(
  AcceptOfferTechnicianDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'phone': instance.phone,
};
