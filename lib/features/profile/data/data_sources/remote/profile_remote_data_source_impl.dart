import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/mappers/mappers.dart';
import 'package:salla7ly/core/networking/api_error_handler.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/features/profile/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:salla7ly/features/profile/domain/entity/profile_response.dart';
import 'package:salla7ly/features/profile/domain/entity/update_profile_request.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService _apiService;

  ProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final response = await _apiService.getProfile();

      return ApiResult.success(response.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updateProfile(
    UpdateProfileRequest request,
  ) async {
    try {
      final response = request.profileImage == null
          ? await _apiService.updateProfile(request.toJson())
          : await _apiService.updateProfileWithImage(
              await _toFormData(request),
            );

      return ApiResult.success(response.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<FormData> _toFormData(UpdateProfileRequest request) async {
    final formData = FormData.fromMap(request.toJson());
    formData.files.add(
      MapEntry(
        'profileImage',
        await MultipartFile.fromFile(
          request.profileImage!.path,
          filename: request.profileImage!.path.split('/').last,
        ),
      ),
    );
    return formData;
  }
}
