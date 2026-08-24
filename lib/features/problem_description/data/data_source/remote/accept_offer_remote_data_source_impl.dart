import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/problem_description/data/data_source/remote/accept_offer_remote_data_source.dart';
import 'package:salla7ly/features/problem_description/domain/entity/accept_offer_response.dart';

@Injectable(as: AcceptOfferRemoteDataSource)
class AcceptOfferRemoteDataSourceImpl implements AcceptOfferRemoteDataSource {
  final ApiService _apiService;

  AcceptOfferRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<AcceptOfferResponse>> acceptOffer(
    String requestId,
    String offerId,
  ) async {
    try {
      final response = await _apiService.acceptOffer(requestId, offerId);

      return ApiResult.success(response.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
