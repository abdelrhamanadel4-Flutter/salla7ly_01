import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salla7ly/core/networking/api_error_model.dart';
import 'package:salla7ly/features/categories/domain/entity/categories_responce.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = Initial;

  const factory CategoriesState.loading() = Loading;

  const factory CategoriesState.success(
    CategoriesResponse data,
  ) = Success;

  const factory CategoriesState.error(
    ApiErrorModel error,
  ) = Error;
}