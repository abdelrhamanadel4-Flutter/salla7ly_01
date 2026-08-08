import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/signup/data/data_sources/remote/sign_up_remote_data_source.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_requset_entity.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_response.dart';
import 'package:salla7ly/features/auth/signup/domain/repo/sign_up_repo.dart';
@Injectable(as: SignUpRepo)
class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemoteDataSource _signUpRemoteDataSource;
  SignUpRepoImpl(this._signUpRemoteDataSource);
  
  @override
  Future<ApiResult<SignUpResponse>> signUp(SignupRequest signUpRequest) async {
    return  await _signUpRemoteDataSource.signUp(signUpRequest);
  }

}