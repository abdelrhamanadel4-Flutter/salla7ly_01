import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';

abstract class OffersRemoteDataSource {
  Future<ApiResult<List<CustomerOffer>>> getOffers(String requestId);
}
