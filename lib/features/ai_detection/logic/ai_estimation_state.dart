import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla7ly/core/networking/api_error_model.dart';

part 'ai_estimation_state.freezed.dart';

@freezed
class AiEstimationState<T> with _$AiEstimationState<T> {
  const factory AiEstimationState.initial() = Initial;

  const factory AiEstimationState.loading() = Loading;

  const factory AiEstimationState.success(
    T data,
  ) = Success<T>;

  const factory AiEstimationState.error(
    ApiErrorModel error,
  ) = Error;
}