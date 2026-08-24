import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/requsets/domain/entity/technician_job.dart';
import 'package:salla7ly/features/requsets/domain/repo/technician_jobs_repo.dart';

@injectable
class GetTechnicianJobsUseCase {
  final TechnicianJobsRepo _repo;

  GetTechnicianJobsUseCase(this._repo);

  Future<ApiResult<List<TechnicianJob>>> execute({
    int? page,
    int? limit,
    String? status,
  }) {
    return _repo.getJobs(page: page, limit: limit, status: status);
  }
}
