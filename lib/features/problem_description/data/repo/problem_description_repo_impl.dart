import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/data/data_source/remote/problem_description_data_source.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_request.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_response.dart';
import 'package:salla7ly/features/problem_description/domain/repo/problem_description_repo.dart';

@Injectable(as: ProblemDescriptionRepo)
class ProblemDescriptionRepositoryImpl extends ProblemDescriptionRepo {
  final ProblemDescriptionRemoteDataSource _remoteDataSource;

  ProblemDescriptionRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<ProblemDescriptionResponse>> createProblemDescription(
    ProblemDescriptionRequest request,
  ) async {
    
    final result = await _remoteDataSource.createProblemDescription(
      request.toDto(),
    );

    return result.when(
      success: (data) {
        return ApiResult.success(data.toEntity());
      },
      failure: (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      },
    );
  }
}
