import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/verify_otp_request.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/verify_otp_response.dart';
import 'package:salla7ly/feature_user/auth/login/domain/repo/login_repo.dart';
@injectable
class VerifyOtpUseCases {
  final LoginRepo _loginRepo;
  VerifyOtpUseCases(this._loginRepo);
  Future<ApiResult<VerifyOtpResponse>> invoke(VerifyOtpRequest body) async {
    return await _loginRepo.verifyOtp(body);
  }
}