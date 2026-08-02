import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/requset_otp_requset.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/requset_otp_response.dart';
import 'package:salla7ly/feature_user/auth/login/domain/repo/login_repo.dart';
@injectable
class RequsetOtpUseCases {
  final LoginRepo _loginRepo;
  RequsetOtpUseCases(this._loginRepo);
  Future<ApiResult<RequsetOtpResponse>> invoke(RequsetOtpRequset body) async {
    return await _loginRepo.requestOtp(body);
  }
}