import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/data/data_sources/remote/technician_reviews_remote_data_source.dart';
import 'package:salla7ly/features/reviews/domain/entities/technician_reviews_page.dart';
import 'package:salla7ly/features/reviews/domain/repo/technician_reviews_repo.dart';

@Injectable(as: TechnicianReviewsRepo)
class TechnicianReviewsRepoImpl implements TechnicianReviewsRepo {
  final TechnicianReviewsRemoteDataSource _remoteDataSource;
  TechnicianReviewsRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<TechnicianReviewsPage>> getMyReviews({
    int? page,
    int? limit,
  }) => _remoteDataSource.getMyReviews(page: page, limit: limit);
}
