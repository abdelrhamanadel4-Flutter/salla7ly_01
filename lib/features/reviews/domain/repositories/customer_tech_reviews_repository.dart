import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/domain/entities/customer_tech_review.dart';

abstract class CustomerTechReviewsRepository {
  Future<ApiResult<CustomerTechReviewsData>> getReviews(
    String technicianId, {
    int page,
    int limit,
  });
}
