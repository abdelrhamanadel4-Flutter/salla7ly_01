import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/profile/domain/entity/profile_response.dart';

abstract class ProfileRepo {
  Future<ApiResult<ProfileResponse>> getProfile();
}
