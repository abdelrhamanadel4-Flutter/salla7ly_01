import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/problem_description/data/data_source/remote/offers_remote_data_source.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';

@Injectable(as: OffersRemoteDataSource)
class OffersRemoteDataSourceImpl implements OffersRemoteDataSource {
  final ApiService _apiService;

  OffersRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<List<CustomerOffer>>> getOffers(String requestId) async {
    try {
      final response = await _apiService.getOffers(requestId);

      return ApiResult.success(response.toEntityList());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
