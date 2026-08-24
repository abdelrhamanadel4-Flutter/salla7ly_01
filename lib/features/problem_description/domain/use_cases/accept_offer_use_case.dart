import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/accept_offer_response.dart';
import 'package:salla7ly/features/problem_description/domain/repo/accept_offer_repo.dart';

@injectable
class AcceptOfferUseCase {
  final AcceptOfferRepo _acceptOfferRepo;

  AcceptOfferUseCase(this._acceptOfferRepo);

  Future<ApiResult<AcceptOfferResponse>> invoke(
    String requestId,
    String offerId,
  ) async {
    return await _acceptOfferRepo.acceptOffer(requestId, offerId);
  }
}
