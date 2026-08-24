import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/data/data_source/remote/customer_tech_reviews_remote_data_source.dart';
import 'package:salla7ly/features/reviews/domain/entities/customer_tech_review.dart';
import 'package:salla7ly/features/reviews/domain/repositories/customer_tech_reviews_repository.dart';

@Injectable(as: CustomerTechReviewsRepository)
class CustomerTechReviewsRepositoryImpl implements CustomerTechReviewsRepository {
  final CustomerTechReviewsRemoteDataSource _remoteDataSource;

  CustomerTechReviewsRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<CustomerTechReviewsData>> getReviews(
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
