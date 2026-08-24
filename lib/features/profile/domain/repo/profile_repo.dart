import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/profile/domain/entity/profile_response.dart';
import 'package:salla7ly/features/profile/domain/entity/update_profile_request.dart';

abstract class ProfileRepo {
  Future<ApiResult<ProfileResponse>> getProfile();
  Future<ApiResult<ProfileResponse>> updateProfile(
    UpdateProfileRequest request,
  );
}
