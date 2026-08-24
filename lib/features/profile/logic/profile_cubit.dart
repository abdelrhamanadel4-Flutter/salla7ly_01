import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:salla7ly/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:salla7ly/features/profile/domain/entity/update_profile_request.dart';
import 'package:salla7ly/features/profile/logic/profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  ProfileCubit(this._getProfileUseCase, this._updateProfileUseCase)
    : super(ProfileState.initial());

  Future<void> getProfile() async {
    emit(const ProfileState.loading());

    final result = await _getProfileUseCase.getProfile();

    result.when(
      success: (data) {
        emit(ProfileState.success(data));
      },
      failure: (error) {
        emit(ProfileState.error(error));
      },
    );
  }

  Future<void> updateProfile(UpdateProfileRequest request) async {
    emit(const ProfileState.loading());

    final result = await _updateProfileUseCase.execute(request);

    result.when(
      success: (data) => emit(ProfileState.success(data)),
      failure: (error) => emit(ProfileState.error(error)),
    );
  }
}
