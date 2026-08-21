// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_description_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemDescriptionRequestDto _$ProblemDescriptionRequestDtoFromJson(
  Map<String, dynamic> json,
) => ProblemDescriptionRequestDto(
  title: json['title'] as String?,
  description: json['description'] as String?,
  categoryId: json['categoryId'] as String?,
  requestType: json['requestType'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  serviceAddress: json['serviceAddress'] as String?,
  serviceCity: json['serviceCity'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProblemDescriptionRequestDtoToJson(
  ProblemDescriptionRequestDto instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'categoryId': instance.categoryId,
  'requestType': instance.requestType,
  'images': instance.images,
  'serviceAddress': instance.serviceAddress,
  'serviceCity': instance.serviceCity,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
