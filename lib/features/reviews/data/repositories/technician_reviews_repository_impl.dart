import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/data/data_source/remote/technician_reviews_remote_data_source.dart';
import 'package:salla7ly/features/reviews/domain/entities/technician_review.dart';
import 'package:salla7ly/features/reviews/domain/repositories/technician_reviews_repository.dart';

@Injectable(as: TechnicianReviewsRepository)
class TechnicianReviewsRepositoryImpl implements TechnicianReviewsRepository {
  final TechnicianReviewsRemoteDataSource _remoteDataSource;

  TechnicianReviewsRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<TechnicianReviewsData>> getReviews(
    String technicianId, {
    int page = 1,
    int limit = 20,
  }) {
    return _remoteDataSource.getReviews(
      technicianId,
      page: page,
      limit: limit,
    );
  }
}
