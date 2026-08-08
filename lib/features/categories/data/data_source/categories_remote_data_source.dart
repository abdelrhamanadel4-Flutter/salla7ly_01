import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/categories/domain/entity/categories_responce.dart';

abstract class CategoriesRemoteDataSource {
  Future<ApiResult<CategoriesResponse>> getCategories();

}