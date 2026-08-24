import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/accept_offer_response.dart';

abstract class AcceptOfferRemoteDataSource {
  Future<ApiResult<AcceptOfferResponse>> acceptOffer(
    String requestId,
    String offerId,
  );
}
