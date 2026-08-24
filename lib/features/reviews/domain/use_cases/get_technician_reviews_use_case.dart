import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/domain/entities/technician_reviews_page.dart';
import 'package:salla7ly/features/reviews/domain/repo/technician_reviews_repo.dart';

@injectable
class GetTechnicianReviewsUseCase {
  final TechnicianReviewsRepo _repo;
  GetTechnicianReviewsUseCase(this._repo);

  Future<ApiResult<TechnicianReviewsPage>> execute({int? page, int? limit}) =>
      _repo.getMyReviews(page: page, limit: limit);
}
