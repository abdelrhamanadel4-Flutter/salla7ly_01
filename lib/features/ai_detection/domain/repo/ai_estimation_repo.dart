import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/ai_detection/domain/entities/ai_estimation_response.dart';

abstract class AiEstimationRepo {
  Future<ApiResult<AiEstimationResponse>> getAiEstimation(String id);
}
