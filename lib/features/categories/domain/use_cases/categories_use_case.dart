import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/categories/domain/entity/categories_responce.dart';

import 'package:salla7ly/features/categories/domain/repo/categories_repo.dart';
@injectable
class CategoriesUseCase {
  final CategoriesRepo _categoriesRepo;
  CategoriesUseCase(this._categoriesRepo);

  Future<ApiResult<CategoriesResponse>> invoke() async {
    return await _categoriesRepo.getCategories();
  }
}