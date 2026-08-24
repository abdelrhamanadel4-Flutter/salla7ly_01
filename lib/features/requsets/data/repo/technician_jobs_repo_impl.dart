import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/requsets/data/data_source/remote/technician_jobs_remote_data_source.dart';
import 'package:salla7ly/features/requsets/domain/entity/submitted_job_offer.dart';
import 'package:salla7ly/features/requsets/domain/entity/technician_job.dart';
import 'package:salla7ly/features/requsets/domain/repo/technician_jobs_repo.dart';

@Injectable(as: TechnicianJobsRepo)
class TechnicianJobsRepoImpl implements TechnicianJobsRepo {
  final TechnicianJobsRemoteDataSource _remoteDataSource;

  TechnicianJobsRepoImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<TechnicianJob>>> getJobs({
    int? page,
    int? limit,
    String? status,
  }) {
    return _remoteDataSource.getJobs(
      page: page,
      limit: limit,
      status: status,
    );
  }

  @override
  Future<ApiResult<SubmittedJobOffer>> submitOffer(
    String offerId,
    num consultationFee,
  ) {
    return _remoteDataSource.submitOffer(offerId, consultationFee);
  }
}
