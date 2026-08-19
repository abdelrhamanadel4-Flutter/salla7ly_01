import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/problem_description/data/data_source/remote/problem_description_data_source.dart';
import 'package:salla7ly/features/problem_description/data/models/problem_description_request_dto.dart';
import 'package:salla7ly/features/problem_description/data/models/problem_description_response_dto.dart';

@Injectable(as: ProblemDescriptionRemoteDataSource)
class ProblemDescriptionDataSourceImpl
    extends ProblemDescriptionRemoteDataSource {
  final ApiService _apiService;
  ProblemDescriptionDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<ProblemDescriptionResponseDto>> createProblemDescription(
    ProblemDescriptionRequestDto request,
  ) async{
    try {
      final response = await _apiService.createProblemDescription(
        request
      );
      return ApiResult.success(response);
    }catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
