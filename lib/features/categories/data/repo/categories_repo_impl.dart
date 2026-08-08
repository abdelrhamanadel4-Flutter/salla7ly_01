import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/categories/data/data_source/categories_remote_data_source.dart';
import 'package:salla7ly/features/categories/domain/entity/categories_responce.dart';
import 'package:salla7ly/features/categories/domain/repo/categories_repo.dart';
@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;
  CategoriesRepoImpl(this._categoriesRemoteDataSource);
  
  @override
  Future<ApiResult<CategoriesResponse>> getCategories() async {
    return await _categoriesRemoteDataSource.getCategories();
  }
}