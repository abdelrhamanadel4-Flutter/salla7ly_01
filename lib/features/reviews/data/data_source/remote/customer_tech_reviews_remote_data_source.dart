import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/reviews/domain/entities/customer_tech_review.dart';

abstract class CustomerTechReviewsRemoteDataSource {
  Future<ApiResult<CustomerTechReviewsData>> getReviews(
    String technicianId, {
    int page,
    int limit,
  });
}

@Injectable(as: CustomerTechReviewsRemoteDataSource)
class CustomerTechReviewsRemoteDataSourceImpl
    implements CustomerTechReviewsRemoteDataSource {
  final ApiService _apiService;

  CustomerTechReviewsRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<CustomerTechReviewsData>> getReviews(
    String technicianId, {
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiService.getCustomerTechReviews(
        technicianId,
        page: page,
        limit: limit,
      );

      return ApiResult.success(
        CustomerTechReviewsData(
          reviews: response.data.map((review) => review.toEntity()).toList(),
          averageRating: response.meta?.averageRating,
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
