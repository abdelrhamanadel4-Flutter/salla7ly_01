import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/data/data_source/remote/publish_remote_data_source.dart';
import 'package:salla7ly/features/problem_description/domain/entity/publish_request_response.dart';
import 'package:salla7ly/features/problem_description/domain/repo/publish_repo.dart';

@Injectable(as: PublishRepo)
class PublishRepoImpl implements PublishRepo {
  final PublishRemoteDataSource _publishRemoteDataSource;

  PublishRepoImpl(this._publishRemoteDataSource);

  @override
  Future<ApiResult<PublishRequestResponse>> publishRequest(
    String id,
  ) async {
    return await _publishRemoteDataSource.publishRequest(id);
  }
}