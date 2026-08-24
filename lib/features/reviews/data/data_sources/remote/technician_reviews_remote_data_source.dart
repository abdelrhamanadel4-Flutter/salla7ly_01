import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/reviews/domain/entities/technician_reviews_page.dart';

abstract class TechnicianReviewsRemoteDataSource {
  Future<ApiResult<TechnicianReviewsPage>> getMyReviews({
    int? page,
    int? limit,
  });
}

@Injectable(as: TechnicianReviewsRemoteDataSource)
class TechnicianReviewsRemoteDataSourceImpl
    implements TechnicianReviewsRemoteDataSource {
  final ApiService _apiService;
  TechnicianReviewsRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<TechnicianReviewsPage>> getMyReviews({
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _apiService.getTechnicianReviews(
        page: page,
        limit: limit,
      );
      return ApiResult.success(
        TechnicianReviewsPage(
          reviews: response.data
              .map(
                (review) => TechnicianReview(
                  id: review.id,
                  comment: review.comment,
                  rating: double.tryParse(review.rating ?? '') ?? 0,
                  customerName: review.customerName,
                ),
              )
              .toList(),
          averageRating: double.tryParse(response.meta.averageRating ?? ''),
          page: response.meta.page,
          totalPages: response.meta.totalPages,
        ),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
