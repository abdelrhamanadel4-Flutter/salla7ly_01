import 'package:json_annotation/json_annotation.dart';
import 'package:salla7ly/features/auth/signup/data/model/catgireos_response_dto.dart';

part 'catgireos_response_dto.g.dart';

@JsonSerializable()
class CatgireosResponseDto {
  @JsonKey(name: 'data')
  final List<DataDtoCatgireosResponse?>? data;

  CatgireosResponseDto({
    this.data,
  });

  factory CatgireosResponseDto.fromJson(Map<String, dynamic> json) => _$CatgireosResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CatgireosResponseDtoToJson(this);
}

@JsonSerializable()
class DataDtoCatgireosResponse {
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

  DataDtoCatgireosResponse({
    this.id,
    this.name,
    this.homeVisitBasePrice,
    this.createdAt,
    this.updatedAt,
  });

  factory DataDtoCatgireosResponse.fromJson(Map<String, dynamic> json) => _$DataDtoCatgireosResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataDtoCatgireosResponseToJson(this);
}