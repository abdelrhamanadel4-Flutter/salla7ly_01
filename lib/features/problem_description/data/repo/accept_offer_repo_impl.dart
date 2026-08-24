import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/data/data_source/remote/accept_offer_remote_data_source.dart';
import 'package:salla7ly/features/problem_description/domain/entity/accept_offer_response.dart';
import 'package:salla7ly/features/problem_description/domain/repo/accept_offer_repo.dart';

@Injectable(as: AcceptOfferRepo)
class AcceptOfferRepoImpl implements AcceptOfferRepo {
  final AcceptOfferRemoteDataSource _acceptOfferRemoteDataSource;

  AcceptOfferRepoImpl(this._acceptOfferRemoteDataSource);

  @override
  Future<ApiResult<AcceptOfferResponse>> acceptOffer(
    String requestId,
    String offerId,
  ) async {
    return await _acceptOfferRemoteDataSource.acceptOffer(requestId, offerId);
  }
}
