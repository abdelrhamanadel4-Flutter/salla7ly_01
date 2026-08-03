import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/catgireos_response.dart';
import 'package:salla7ly/features/auth/signup/domain/repo/sign_up_repo.dart';
@injectable
class CategoriesUseCase {
  final SignUpRepo _signUpRepo;
  CategoriesUseCase(this._signUpRepo);

  Future<ApiResult<CatgireosResponse>> invoke() async {
    return await _signUpRepo.getCategories();
  }
}