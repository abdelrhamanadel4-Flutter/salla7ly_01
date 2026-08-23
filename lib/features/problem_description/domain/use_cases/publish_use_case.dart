import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/publish_request_response.dart';
import 'package:salla7ly/features/problem_description/domain/repo/publish_repo.dart';

@injectable
class PublishUseCase {
  final PublishRepo _publishRepo;

  PublishUseCase(this._publishRepo);

  Future<ApiResult<PublishRequestResponse>> invoke(String id) async {
    return await _publishRepo.publishRequest(id);
  }
}