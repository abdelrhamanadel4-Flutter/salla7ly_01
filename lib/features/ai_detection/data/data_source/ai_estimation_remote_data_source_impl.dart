import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/ai_detection/data/data_source/ai_estimation_remote_data_source.dart';
import 'package:salla7ly/features/ai_detection/domain/entities/ai_estimation_response.dart';

@Injectable(as: AiEstimationRemoteDataSource)
class AiEstimationRemoteDataSourceImpl
    implements AiEstimationRemoteDataSource {
  final ApiService _apiService;

  AiEstimationRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<AiEstimationResponse>> getAiEstimation(String id) async {
    try {
      final response = await _apiService.getAiEstimation(id);

      return ApiResult.success(response.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}