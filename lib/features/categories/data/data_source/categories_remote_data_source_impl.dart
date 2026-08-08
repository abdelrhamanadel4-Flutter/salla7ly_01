import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/categories/data/data_source/categories_remote_data_source.dart';
import 'package:salla7ly/features/categories/domain/entity/categories_responce.dart';
@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiService _apiService;
  CategoriesRemoteDataSourceImpl(this._apiService);
  
  Future<ApiResult<CategoriesResponse>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return ApiResult.success(response.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
