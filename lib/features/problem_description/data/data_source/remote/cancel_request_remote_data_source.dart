import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_response.dart';

abstract class CancelRequestRemoteDataSource {
  Future<ApiResult<ProblemDescriptionResponse>> cancelRequest(String requestId);
}
