import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/ai_detection/domain/entities/ai_estimation_response.dart';
import 'package:salla7ly/features/ai_detection/domain/repo/ai_estimation_repo.dart';

@injectable
class AiEstimationUseCase {
  final AiEstimationRepo _aiEstimationRepo;

  AiEstimationUseCase(this._aiEstimationRepo);

  Future<ApiResult<AiEstimationResponse>> invoke(String id) async {
    return await _aiEstimationRepo.getAiEstimation(id);
  }
}