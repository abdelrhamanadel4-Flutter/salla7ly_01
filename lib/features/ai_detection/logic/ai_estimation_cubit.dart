import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/ai_detection/domain/use_cases/ai_estimation_use_case.dart';

import 'ai_estimation_state.dart';

@injectable
class AiEstimationCubit extends Cubit<AiEstimationState> {
  final AiEstimationUseCase _aiEstimationUseCase;

  AiEstimationCubit(this._aiEstimationUseCase)
      : super(AiEstimationState.initial());

  Future<void> getAiEstimation(String id) async {
    if (state is Loading) return;

    emit(AiEstimationState.loading());

    final result = await _aiEstimationUseCase.invoke(id);

    result.when(
      success: (data) {
        emit(AiEstimationState.success(data));
      },
      failure: (error) {
        emit(AiEstimationState.error(error));
      },
    );
  }
}