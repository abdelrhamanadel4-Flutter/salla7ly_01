import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/data/models/problem_description_request_dto.dart';
import 'package:salla7ly/features/problem_description/data/models/problem_description_response_dto.dart';

abstract class ProblemDescriptionRemoteDataSource {
  Future<ApiResult<ProblemDescriptionResponseDto>> createProblemDescription(
    ProblemDescriptionRequestDto request,
  );
}