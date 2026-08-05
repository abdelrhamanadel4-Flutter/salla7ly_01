import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/helpers/constansts.dart';
import 'package:salla7ly/core/helpers/shared_pref_helper.dart';
import 'package:salla7ly/core/networking/api_constants.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_requset_entity.dart';
import 'package:salla7ly/features/auth/signup/domain/use_cases/sign_up_use_case.dart';
import 'package:salla7ly/features/auth/signup/logic/sign_up/sign_up_state.dart';

@injectable
class SignupCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signupUseCase;

  SignupCubit(this._signupUseCase) : super(const SignUpState.initial());
  final ImagePicker _imagePicker = ImagePicker();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final locationController = TextEditingController();
  final nationalIdController = TextEditingController();
  File? profileImage;
  File? criminalRecordFile;

  Future<void> signup(SignupRequest request) async {
    emit(const SignUpState.loading());

    final result = await _signupUseCase.invoke(request);

    result.when(
      success: (data) {
        emit(SignUpState.success(data));
      },
      failure: (error) async{
         if (error.statusCode == 401 && await _tryRefreshAccessToken()) {
          final retryResult = await _signupUseCase.invoke(request);
          retryResult.when(
            success: (data) => emit(SignUpState.success(data)),
            failure: (retryError) => emit(SignUpState.error(retryError)),
          );
          return;
        }
        emit(SignUpState.error(error));
      },
    );
  }

  Future<bool> _tryRefreshAccessToken() async {
    try {
      final refreshToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.refreshToken,
      );
      if (refreshToken.isEmpty) return false;

      final plainDio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
      final response = await plainDio.post(
        ApiConstants.refreshOtp,
        data: {'refreshToken': refreshToken},
      );

      final tokens = response.data?['data']?['tokens'];
      final newAccessToken = tokens?['accessToken'] as String?;
      final newRefreshToken = tokens?['refreshToken'] as String?;

      if (newAccessToken == null || newAccessToken.isEmpty) return false;

      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        newAccessToken,
      );
      if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshToken,
          newRefreshToken,
        );
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Profile Image
  Future<void> pickProfileImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      profileImage = File(image.path);

      emit(const SignUpState.initial());
      emit(const SignUpState.refresh());
    }
  }

  /// Criminal Record
  Future<void> pickCriminalRecord() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null) {
      criminalRecordFile = File(result.files.single.path!);

      emit(const SignUpState.initial());
      emit(const SignUpState.refresh());
    }
  }
}
