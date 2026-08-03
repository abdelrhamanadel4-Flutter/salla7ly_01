import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/login/domain/entity/refresh_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_response.dart';
import 'package:salla7ly/features/auth/login/domain/repo/login_repo.dart';
@injectable
class RefreshOtpUseCases {
  final LoginRepo _loginRepo;
  RefreshOtpUseCases(this._loginRepo);
  Future<ApiResult<VerifyOtpResponse>> invoke(RefreshOtpRequset body) async {
    return await _loginRepo.refreshOtp(body);
  }
}
