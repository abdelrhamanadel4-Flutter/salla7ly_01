import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla7ly/core/networking/api_error_model.dart';

part 'publish_state.freezed.dart';

@freezed
class PublishState<T> with _$PublishState<T> {
  const factory PublishState.initial() = Initial;

  const factory PublishState.loading() = Loading;

  const factory PublishState.success(
    T data,
  ) = Success<T>;

  const factory PublishState.error(
    ApiErrorModel error,
  ) = Error;
}