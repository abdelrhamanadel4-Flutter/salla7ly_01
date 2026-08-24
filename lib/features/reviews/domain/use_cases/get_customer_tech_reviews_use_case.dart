import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/domain/entities/customer_tech_review.dart';
import 'package:salla7ly/features/reviews/domain/repositories/customer_tech_reviews_repository.dart';

@injectable
class GetCustomerTechReviewsUseCase {
  final CustomerTechReviewsRepository _repository;

  GetCustomerTechReviewsUseCase(this._repository);

  Future<ApiResult<CustomerTechReviewsData>> execute(
    String technicianId, {
    int page = 1,
    int limit = 20,
  }) {
    return _repository.getReviews(technicianId, page: page, limit: limit);
  }
}
