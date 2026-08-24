import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/domain/entities/technician_review.dart';

abstract class TechnicianReviewsRepository {
  Future<ApiResult<TechnicianReviewsData>> getReviews(
    String technicianId, {
    int page,
    int limit,
  });
}
