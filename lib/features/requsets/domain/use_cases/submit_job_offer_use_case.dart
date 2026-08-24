import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/requsets/domain/entity/submitted_job_offer.dart';
import 'package:salla7ly/features/requsets/domain/repo/technician_jobs_repo.dart';

@injectable
class SubmitJobOfferUseCase {
  final TechnicianJobsRepo _repo;

  SubmitJobOfferUseCase(this._repo);

  Future<ApiResult<SubmittedJobOffer>> execute(
    String offerId,
    num consultationFee,
  ) {
    return _repo.submitOffer(offerId, consultationFee);
  }
}
