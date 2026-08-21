import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/ai_detection/data/data_source/ai_estimation_remote_data_source.dart';
import 'package:salla7ly/features/ai_detection/domain/entities/ai_estimation_response.dart';
import 'package:salla7ly/features/ai_detection/domain/repo/ai_estimation_repo.dart';

@Injectable(as: AiEstimationRepo)
class AiEstimationRepoImpl implements AiEstimationRepo {
  final AiEstimationRemoteDataSource _aiEstimationRemoteDataSource;

  AiEstimationRepoImpl(this._aiEstimationRemoteDataSource);

  @override
  Future<ApiResult<AiEstimationResponse>> getAiEstimation(String id) async {
    return await _aiEstimationRemoteDataSource.getAiEstimation(id);
  }
}