import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/domain/entities/technician_reviews_page.dart';

abstract class TechnicianReviewsRepo {
  Future<ApiResult<TechnicianReviewsPage>> getMyReviews({
    int? page,
    int? limit,
  });
}
