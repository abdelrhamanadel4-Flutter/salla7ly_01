import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_requset_entity.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_response.dart';
import 'package:salla7ly/features/auth/signup/domain/repo/sign_up_repo.dart';

@injectable
class SignUpUseCase {
  final SignUpRepo _signUpRepo;

  SignUpUseCase(this._signUpRepo);

Future<ApiResult<SignUpResponse>> invoke (SignupRequest signUpRequest) {
    return _signUpRepo.signUp(signUpRequest); 
    
  }
}