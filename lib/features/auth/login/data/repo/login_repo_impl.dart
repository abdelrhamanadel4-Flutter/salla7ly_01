import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/login/data/data_sources/remote/login_remote_data_sources.dart';
import 'package:salla7ly/features/auth/login/domain/entity/refresh_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_response.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_request.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_response.dart';
import 'package:salla7ly/features/auth/login/domain/repo/login_repo.dart';
@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSources _loginRemoteDataSources;
  LoginRepoImpl(this._loginRemoteDataSources);
  @override
  Future<ApiResult<VerifyOtpResponse>> refreshOtp(RefreshOtpRequset body) {
    return _loginRemoteDataSources.refreshOtp(body);
   
  }

  @override
  Future<ApiResult<RequsetOtpResponse>> requestOtp(RequsetOtpRequset body) {
    return _loginRemoteDataSources.requestOtp(body);
  }

  @override
  Future<ApiResult<VerifyOtpResponse>> verifyOtp(VerifyOtpRequest body) {
    return _loginRemoteDataSources.verifyOtp(body);
  }
  
}
