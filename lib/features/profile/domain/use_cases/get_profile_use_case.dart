import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/profile/domain/entity/profile_response.dart';
import 'package:salla7ly/features/profile/domain/repo/profile_repo.dart';

@injectable
class GetProfileUseCase {
  final ProfileRepo _profileRepo;

  GetProfileUseCase(this._profileRepo);

  Future<ApiResult<ProfileResponse>> getProfile() {
    return _profileRepo.getProfile();
  }
}
