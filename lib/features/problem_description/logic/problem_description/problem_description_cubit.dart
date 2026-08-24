import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/helpers/validatores.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_request.dart';
import 'package:salla7ly/features/problem_description/domain/use_cases/problem_description_use_case.dart';

import 'problem_description_state.dart';

@injectable
class ProblemDescriptionCubit extends Cubit<ProblemDescriptionState> {
  final ProblemDescriptionUseCase _problemDescriptionUseCase;
  ProblemDescriptionCubit(this._problemDescriptionUseCase) : super(ProblemDescriptionState.initial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  File? problemImage;

  Future<void> createProblemDescription(ProblemDescriptionRequest request) async {
    
    if (state is Loading) return;
    
      emit(ProblemDescriptionState.loading());
      final result = await _problemDescriptionUseCase.createProblemDescription(request);
      result.when(
        success: (data) async {
          emit(ProblemDescriptionState.success(data));
        },
        failure: (error) {
          emit(ProblemDescriptionState.error(error));
        },
      );
    
  }

  Future<String?> pickProblemImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) return null;

    final imageFile = File(image.path);
    final validationError = AppValidators.validateImageSize(imageFile);
    if (validationError != null) return validationError;

    problemImage = imageFile;
    emit(ProblemDescriptionState.initial());
    emit(const ProblemDescriptionState.refresh());
    return null;
  }

  @override
  Future<void> close() {
    descriptionController.dispose();
    titleController.dispose();
    return super.close();
  }

}
