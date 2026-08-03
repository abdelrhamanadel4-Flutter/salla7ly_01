import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/signup/domain/use_cases/categories_use_case.dart';
import 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesUseCase _categoriesUseCase;

  CategoriesCubit(this._categoriesUseCase)
      : super(const CategoriesState.initial());

  Future<void> getCategories() async {
    emit(const CategoriesState.loading());

    final result = await _categoriesUseCase.invoke();

    result.when(
      success: (data) {
        emit(CategoriesState.success(data));
      },
      failure: (error) {
        emit(CategoriesState.error(error));
      },
    );
  }
}