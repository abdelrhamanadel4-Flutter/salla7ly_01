// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_estimation_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiEstimationResponseDto _$AiEstimationResponseDtoFromJson(
  Map<String, dynamic> json,
) => AiEstimationResponseDto(
  data: json['data'] == null
      ? null
      : DataAiEstimationDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AiEstimationResponseDtoToJson(
  AiEstimationResponseDto instance,
) => <String, dynamic>{'data': instance.data};

DataAiEstimationDto _$DataAiEstimationDtoFromJson(Map<String, dynamic> json) =>
    DataAiEstimationDto(
      estimation: json['estimation'] == null
          ? null
          : EstimationDto.fromJson(json['estimation'] as Map<String, dynamic>),
      pointsCharged: (json['pointsCharged'] as num?)?.toInt(),
      pointsBalance: (json['pointsBalance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataAiEstimationDtoToJson(
  DataAiEstimationDto instance,
) => <String, dynamic>{
  'estimation': instance.estimation,
  'pointsCharged': instance.pointsCharged,
  'pointsBalance': instance.pointsBalance,
};

EstimationDto _$EstimationDtoFromJson(Map<String, dynamic> json) =>
    EstimationDto(
      severity: json['severity'] as String?,
      minPrice: json['minPrice'] as String?,
      maxPrice: json['maxPrice'] as String?,
      confidence: json['confidence'] as String?,
    );

Map<String, dynamic> _$EstimationDtoToJson(EstimationDto instance) =>
    <String, dynamic>{
      'severity': instance.severity,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'confidence': instance.confidence,
    };
