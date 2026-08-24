import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/features/requsets/data/models/submit_job_offer_dto.dart';
import 'package:salla7ly/features/requsets/domain/entity/submitted_job_offer.dart';
import 'package:salla7ly/features/requsets/domain/entity/technician_job.dart';

abstract class TechnicianJobsRemoteDataSource {
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

@Injectable(as: TechnicianJobsRemoteDataSource)
class TechnicianJobsRemoteDataSourceImpl
    implements TechnicianJobsRemoteDataSource {
  final ApiService _apiService;

  TechnicianJobsRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<List<TechnicianJob>>> getJobs({
    int? page,
    int? limit,
    String? status,
  }) async {
    try {
      final response = await _apiService.getTechnicianJobs(
        page: page,
        limit: limit,
        status: status,
      );
      return ApiResult.success(
        response.data?.map((dto) => dto.toDomain()).toList() ?? [],
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<SubmittedJobOffer>> submitOffer(
    String offerId,
    num consultationFee,
  ) async {
    try {
      final response = await _apiService.submitJobOffer(
        offerId,
        SubmitJobOfferDto(consultationFee: consultationFee),
      );
      final d = response.data;
      return ApiResult.success(
        SubmittedJobOffer(
          id: d?.id,
          status: d?.status,
          consultationFee: d?.consultationFee,
          submittedAt: d?.submittedAt,
        ),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
