import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';
import 'package:salla7ly/features/problem_description/domain/repo/offers_repo.dart';

@injectable
class GetOffersUseCase {
  final OffersRepo _offersRepo;

  GetOffersUseCase(this._offersRepo);

  Future<ApiResult<List<CustomerOffer>>> invoke(String requestId) async {
    return await _offersRepo.getOffers(requestId);
  }
}
