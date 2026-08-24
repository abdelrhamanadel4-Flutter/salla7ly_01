import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/data/data_source/remote/cancel_request_remote_data_source.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_response.dart';
import 'package:salla7ly/features/problem_description/domain/repo/cancel_request_repo.dart';

@Injectable(as: CancelRequestRepo)
class CancelRequestRepoImpl implements CancelRequestRepo {
  final CancelRequestRemoteDataSource _remoteDataSource;

  CancelRequestRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<ProblemDescriptionResponse>> cancelRequest(String requestId) {
    return _remoteDataSource.cancelRequest(requestId);
  }
}
