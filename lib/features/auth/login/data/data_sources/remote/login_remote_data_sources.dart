import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/login/domain/entity/refresh_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_response.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_request.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_response.dart';

abstract class LoginRemoteDataSources {
    Future<ApiResult<RequsetOtpResponse>> requestOtp(RequsetOtpRequset body);
    Future<ApiResult<VerifyOtpResponse>> verifyOtp(VerifyOtpRequest body);
    Future<ApiResult<VerifyOtpResponse>> refreshOtp(RefreshOtpRequset body);

}