import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
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
  File? nationalId;
  File? criminalRecordFile;

  


  Future<void> signup(SignupRequest request) async {
    emit(const SignUpState.loading());

    final result = await _signupUseCase.invoke(request);

    result.when(
      success: (data) {
        emit(SignUpState.success(data));
      },
      failure: (error) {
        emit(SignUpState.error(error));
      },
    );
  }
    /// Profile Image
  Future<void> pickProfileImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      profileImage = File(image.path);

          emit(const SignUpState.refresh());

    }
  }

  /// National ID
  Future<void> pickNationalId() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null) {
      nationalId = File(result.files.single.path!);

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

     emit(const SignUpState.refresh());
    }
  }

 

}