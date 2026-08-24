import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla7ly/core/networking/api_error_model.dart';
import 'package:salla7ly/features/profile/domain/entity/profile_response.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.loading() = Loading;

  const factory ProfileState.success(ProfileResponse data) = Success;

  const factory ProfileState.error(ApiErrorModel apiErrorModel) = Error;
}
