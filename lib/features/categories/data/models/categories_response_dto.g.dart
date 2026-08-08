// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponseDto _$CategoriesResponseDtoFromJson(
  Map<String, dynamic> json,
) => CategoriesResponseDto(
  data: (json['data'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : DataDtoCategoriesResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$CategoriesResponseDtoToJson(
  CategoriesResponseDto instance,
) => <String, dynamic>{'data': instance.data};

DataDtoCategoriesResponse _$DataDtoCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => DataDtoCategoriesResponse(
  id: json['id'] as String?,
  name: json['name'] as String?,
  homeVisitBasePrice: json['homeVisitBasePrice'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$DataDtoCategoriesResponseToJson(
  DataDtoCategoriesResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'homeVisitBasePrice': instance.homeVisitBasePrice,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
