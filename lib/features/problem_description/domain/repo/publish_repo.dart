import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/publish_request_response.dart';

abstract class PublishRepo {
  Future<ApiResult<PublishRequestResponse>> publishRequest(String id);
}