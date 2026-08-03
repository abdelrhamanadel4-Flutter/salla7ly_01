import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_requset_entity.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_response.dart';

abstract class SignUpRepo {
  Future<ApiResult<SignUpResponse>> signUp( SignupRequest signUpRequest );

}