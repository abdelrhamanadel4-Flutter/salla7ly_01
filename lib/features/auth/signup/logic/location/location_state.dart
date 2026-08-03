
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/select_location.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = Initial;

  const factory LocationState.loading() = Loading;

  const factory LocationState.loaded(
    SelectedLocation location,
  ) = Loaded;

  const factory LocationState.error(
    String message,
  ) = Error;
}