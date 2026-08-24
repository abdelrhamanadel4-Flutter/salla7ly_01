import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/problem_description/data/data_source/remote/cancel_request_remote_data_source.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_response.dart';

@Injectable(as: CancelRequestRemoteDataSource)
class CancelRequestRemoteDataSourceImpl implements CancelRequestRemoteDataSource {
  final ApiService _apiService;

  CancelRequestRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<ProblemDescriptionResponse>> cancelRequest(
    String requestId,
  ) async {
    try {
      final response = await _apiService.cancelRequest(requestId);
      return ApiResult.success(response.toEntity());
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
