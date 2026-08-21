import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_request.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_response.dart';

abstract class ProblemDescriptionRepo {
  Future<ApiResult<ProblemDescriptionResponse>> createProblemDescription(
    ProblemDescriptionRequest request,
  );
}