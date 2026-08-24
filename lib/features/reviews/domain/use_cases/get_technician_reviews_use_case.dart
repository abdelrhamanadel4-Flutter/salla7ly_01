import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/domain/entities/technician_review.dart';
import 'package:salla7ly/features/reviews/domain/repositories/technician_reviews_repository.dart';

@injectable
class GetTechnicianReviewsUseCase {
  final TechnicianReviewsRepository _repository;

  GetTechnicianReviewsUseCase(this._repository);

  Future<ApiResult<TechnicianReviewsData>> execute(
    String technicianId, {
    int page = 1,
    int limit = 20,
  }) {
    return _repository.getReviews(technicianId, page: page, limit: limit);
  }
}
