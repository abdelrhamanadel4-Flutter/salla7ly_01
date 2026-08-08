import 'package:json_annotation/json_annotation.dart';

part 'categories_response_dto.g.dart';

@JsonSerializable()
class CategoriesResponseDto {
  @JsonKey(name: 'data')
  final List<DataDtoCategoriesResponse?>? data;

  CategoriesResponseDto({
    this.data,
  });

  factory CategoriesResponseDto.fromJson(Map<String, dynamic> json) => _$CategoriesResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponseDtoToJson(this);
}

@JsonSerializable()
class DataDtoCategoriesResponse {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'homeVisitBasePrice')
  final String? homeVisitBasePrice;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  DataDtoCategoriesResponse({
    this.id,
    this.name,
    this.homeVisitBasePrice,
    this.createdAt,
    this.updatedAt,
  });

  factory DataDtoCategoriesResponse.fromJson(Map<String, dynamic> json) => _$DataDtoCategoriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataDtoCategoriesResponseToJson(this);
}