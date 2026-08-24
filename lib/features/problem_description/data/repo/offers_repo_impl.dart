import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/data/data_source/remote/offers_remote_data_source.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';
import 'package:salla7ly/features/problem_description/domain/repo/offers_repo.dart';

@Injectable(as: OffersRepo)
class OffersRepoImpl implements OffersRepo {
  final OffersRemoteDataSource _offersRemoteDataSource;

  OffersRepoImpl(this._offersRemoteDataSource);

  @override
  Future<ApiResult<List<CustomerOffer>>> getOffers(String requestId) async {
    return await _offersRemoteDataSource.getOffers(requestId);
  }
}
