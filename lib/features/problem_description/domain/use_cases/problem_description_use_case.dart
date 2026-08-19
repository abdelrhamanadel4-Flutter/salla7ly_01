import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_request.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_response.dart';
import 'package:salla7ly/features/problem_description/domain/repo/problem_description_repo.dart';

@injectable
class ProblemDescriptionUseCase {
  final ProblemDescriptionRepo _problemDescriptionRepo;
  ProblemDescriptionUseCase(this._problemDescriptionRepo);

  Future<ApiResult<ProblemDescriptionResponse>> createProblemDescription(
    ProblemDescriptionRequest request,
  ) async{
    return await _problemDescriptionRepo.createProblemDescription(request);
  }
}
