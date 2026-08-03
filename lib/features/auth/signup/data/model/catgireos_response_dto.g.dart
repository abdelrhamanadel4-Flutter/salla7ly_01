// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catgireos_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatgireosResponseDto _$CatgireosResponseDtoFromJson(
  Map<String, dynamic> json,
) => CatgireosResponseDto(
  data: (json['data'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : DataDtoCatgireosResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$CatgireosResponseDtoToJson(
  CatgireosResponseDto instance,
) => <String, dynamic>{'data': instance.data};

DataDtoCatgireosResponse _$DataDtoCatgireosResponseFromJson(
  Map<String, dynamic> json,
) => DataDtoCatgireosResponse(
  id: json['id'] as String?,
  name: json['name'] as String?,
  homeVisitBasePrice: json['homeVisitBasePrice'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$DataDtoCatgireosResponseToJson(
  DataDtoCatgireosResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'homeVisitBasePrice': instance.homeVisitBasePrice,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
