import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/helpers/constansts.dart';
import 'package:salla7ly/core/helpers/shared_pref_helper.dart';
import 'package:salla7ly/core/helpers/validatores.dart';
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
      success: (data) async {
        final accountState = data.data?.accountState;
        if (accountState != null) {
          await SharedPrefHelper.setData(
            SharedPrefKeys.accountState,
            accountState,
          );
        }
        final role = data.data?.user?.role;
        if (role != null && role.isNotEmpty) {
          await SharedPrefHelper.setData(SharedPrefKeys.userRole, role);
        }
        emit(SignUpState.success(data));
      },
      failure: (error) async {
    
        emit(SignUpState.error(error));
      },
    );
  }

  /// Profile Image
  Future<String?> pickProfileImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) return null;

    final imageFile = File(image.path);
    final validationError = AppValidators.validateImageSize(imageFile);
    if (validationError != null) return validationError;

    profileImage = imageFile;
    emit(const SignUpState.initial());
    emit(const SignUpState.refresh());
    return null;
  }

  /// Criminal Record
  Future<String?> pickCriminalRecord() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result == null || result.files.single.path == null) return null;

    final file = File(result.files.single.path!);
    final validationError = AppValidators.validateImageSize(file);
    if (validationError != null) return validationError;

    criminalRecordFile = file;
    emit(const SignUpState.initial());
    emit(const SignUpState.refresh());
    return null;
  }
}
