import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/profile/domain/entity/profile_response.dart';
import 'package:salla7ly/features/profile/domain/entity/update_profile_request.dart';
import 'package:salla7ly/features/profile/domain/repo/profile_repo.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepo _profileRepo;

  UpdateProfileUseCase(this._profileRepo);

  Future<ApiResult<ProfileResponse>> execute(UpdateProfileRequest request) {
    return _profileRepo.updateProfile(request);
  }
}
