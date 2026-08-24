import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/requsets/domain/entity/submitted_job_offer.dart';
import 'package:salla7ly/features/requsets/domain/entity/technician_job.dart';

abstract class TechnicianJobsRepo {
  Future<ApiResult<List<TechnicianJob>>> getJobs({
    int? page,
    int? limit,
    String? status,
  });

  Future<ApiResult<SubmittedJobOffer>> submitOffer(
    String offerId,
    num consultationFee,
  );
}
