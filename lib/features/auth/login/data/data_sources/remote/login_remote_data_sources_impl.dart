import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/auth/login/data/data_sources/remote/login_remote_data_sources.dart';
import 'package:salla7ly/features/auth/login/domain/entity/refresh_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_response.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_request.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_response.dart';
@Injectable(as: LoginRemoteDataSources)
class LoginRemoteDataSourcesImpl extends LoginRemoteDataSources {
    final ApiService _apiService;
    LoginRemoteDataSourcesImpl(this._apiService);
    @override
    Future<ApiResult<RequsetOtpResponse>> requestOtp(RequsetOtpRequset body) async {
      try {
        final response = await _apiService.requestOtp(body.toDto());
        return ApiResult.success(response.toEntity());
      } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
      }
    }
  
    @override
    Future<ApiResult<VerifyOtpResponse>> verifyOtp(VerifyOtpRequest body) async {
      try {
        final response = await _apiService.verifyOtp(body.toDto());
        return ApiResult.success(response.toEntity());
      } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
      }
    }
  
    @override
    Future<ApiResult<VerifyOtpResponse>> refreshOtp(RefreshOtpRequset body) async {
      try {
        final response = await _apiService.refreshOtp(body.toDto());
        return ApiResult.success(response.toEntity());
      } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
      }
    }

}
