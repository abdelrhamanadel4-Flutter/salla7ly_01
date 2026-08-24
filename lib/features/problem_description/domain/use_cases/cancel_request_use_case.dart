import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_response.dart';
import 'package:salla7ly/features/problem_description/domain/repo/cancel_request_repo.dart';

@injectable
class CancelRequestUseCase {
  final CancelRequestRepo _repository;

  CancelRequestUseCase(this._repository);

  Future<ApiResult<ProblemDescriptionResponse>> invoke(String requestId) {
    return _repository.cancelRequest(requestId);
  }
}
