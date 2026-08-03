import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/auth/signup/data/data_sources/remote/sign_up_remote_data_source.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_requset_entity.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_response.dart';
@Injectable(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final ApiService _apiService;
  SignUpRemoteDataSourceImpl(this._apiService);
  @override
  Future<ApiResult<SignUpResponse>> signUp(SignupRequest request) async {
    try {
      final formData = request.toFormData();
      final response = await _apiService.signUp(await formData);
      return ApiResult.success(response.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
