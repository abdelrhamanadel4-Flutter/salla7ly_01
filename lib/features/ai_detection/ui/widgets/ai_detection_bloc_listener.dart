import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/widgets/dilaog_utils.dart';
import 'package:salla7ly/features/ai_detection/logic/ai_estimation_cubit.dart';
import 'package:salla7ly/features/ai_detection/logic/ai_estimation_state.dart';

class AiEstimationBlocListener extends StatelessWidget {
  const AiEstimationBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AiEstimationCubit, AiEstimationState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            DialogUtils.showLoading(context: context);
          },
          success: (data) {
            DialogUtils.hideLoading(context);
          },
          error: (error) {
            DialogUtils.hideLoading(context);

            DialogUtils.showMessage(
              context: context,
              type: DialogType.error,
              title: 'حصل خطأ',
              message: error.error?.message ?? 'حصل خطأ، حاول تاني',
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}