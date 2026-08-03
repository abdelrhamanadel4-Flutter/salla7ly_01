import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/catgireos_response.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_requset_entity.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_response.dart';

abstract class SignUpRemoteDataSource {
  Future<ApiResult<SignUpResponse>> signUp( SignupRequest signUpRequest );
  Future<ApiResult<CatgireosResponse>> getCategories();

}