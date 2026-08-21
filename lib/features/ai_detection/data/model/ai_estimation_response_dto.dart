import 'package:json_annotation/json_annotation.dart';

part 'ai_estimation_response_dto.g.dart';

@JsonSerializable()
class AiEstimationResponseDto {
  @JsonKey(name: 'data')
  final DataAiEstimationDto? data;

  AiEstimationResponseDto({
    this.data,
  });

  factory AiEstimationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AiEstimationResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AiEstimationResponseDtoToJson(this);
}

@JsonSerializable()
class DataAiEstimationDto {
  @JsonKey(name: 'estimation')
  final EstimationDto? estimation;

  @JsonKey(name: 'pointsCharged')
  final int? pointsCharged;

  @JsonKey(name: 'pointsBalance')
  final int? pointsBalance;

  DataAiEstimationDto({
    this.estimation,
    this.pointsCharged,
    this.pointsBalance,
  });

  factory DataAiEstimationDto.fromJson(Map<String, dynamic> json) =>
      _$DataAiEstimationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataAiEstimationDtoToJson(this);
}

@JsonSerializable()
class EstimationDto {
  @JsonKey(name: 'severity')
  final String? severity;

  @JsonKey(name: 'minPrice')
  final String? minPrice;

  @JsonKey(name: 'maxPrice')
  final String? maxPrice;

  @JsonKey(name: 'confidence')
  final String? confidence;

  EstimationDto({
    this.severity,
    this.minPrice,
    this.maxPrice,
    this.confidence,
  });

  factory EstimationDto.fromJson(Map<String, dynamic> json) =>
      _$EstimationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EstimationDtoToJson(this);
}