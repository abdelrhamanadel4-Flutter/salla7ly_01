import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/reviews/domain/entities/technician_review.dart';

abstract class TechnicianReviewsRemoteDataSource {
  Future<ApiResult<TechnicianReviewsData>> getReviews(
    String technicianId, {
    int page,
    int limit,
  });
}

@Injectable(as: TechnicianReviewsRemoteDataSource)
class TechnicianReviewsRemoteDataSourceImpl
    implements TechnicianReviewsRemoteDataSource {
  final ApiService _apiService;

  TechnicianReviewsRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<TechnicianReviewsData>> getReviews(
    String technicianId, {
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiService.getTechnicianReviews(
        technicianId,
        page: page,
        limit: limit,
      );

      return ApiResult.success(
        TechnicianReviewsData(
          reviews: response.data.map((review) => review.toEntity()).toList(),
          averageRating: response.meta?.averageRating,
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
