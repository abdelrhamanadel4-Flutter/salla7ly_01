
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla7ly/core/networking/api_error_model.dart';
part 'problem_description_state.freezed.dart';


@freezed
class ProblemDescriptionState<T> with _$ProblemDescriptionState<T> {
  const factory ProblemDescriptionState.initial() = Initial;

  const factory ProblemDescriptionState.loading() = Loading;

  const factory ProblemDescriptionState.success(
    T data,
  ) = Success<T>;

  const factory ProblemDescriptionState.error(
    ApiErrorModel error,
  ) = Error;

    const factory ProblemDescriptionState.refresh() = Refresh<T>;
}
