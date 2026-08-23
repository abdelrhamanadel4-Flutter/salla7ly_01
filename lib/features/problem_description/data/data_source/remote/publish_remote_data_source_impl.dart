import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/problem_description/data/data_source/remote/publish_remote_data_source.dart';
import 'package:salla7ly/features/problem_description/domain/entity/publish_request_response.dart';

@Injectable(as: PublishRemoteDataSource)
class PublishRemoteDataSourceImpl implements PublishRemoteDataSource {
  final ApiService _apiService;

  PublishRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<PublishRequestResponse>> publishRequest(
    String id,
  ) async {
    try {
      final response = await _apiService.publishRequest(id);

      return ApiResult.success(response.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}