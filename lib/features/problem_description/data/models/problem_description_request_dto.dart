
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'problem_description_request_dto.g.dart';

@JsonSerializable()
class ProblemDescriptionRequestDto {
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'categoryId')
  final String? categoryId;
  @JsonKey(name: 'requestType')
  final String? requestType;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'serviceAddress')
  final String? serviceAddress;
  @JsonKey(name: 'serviceCity')
  final String? serviceCity;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longitude')
  final double? longitude;

  ProblemDescriptionRequestDto({
    this.title,
    this.description,
    this.categoryId,
    this.requestType,
    this.images,
    this.serviceAddress,
    this.serviceCity,
    this.latitude,
    this.longitude,
  });

  factory ProblemDescriptionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ProblemDescriptionRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProblemDescriptionRequestDtoToJson(this);
}
