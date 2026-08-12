import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/profile/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:salla7ly/features/profile/domain/entity/profile_response.dart';
import 'package:salla7ly/features/profile/domain/repo/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl extends ProfileRepo {

  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepoImpl(this._profileRemoteDataSource);

  @override
  Future<ApiResult<ProfileResponse>> getProfile() async {
      return  _profileRemoteDataSource.getProfile();
  }
}
