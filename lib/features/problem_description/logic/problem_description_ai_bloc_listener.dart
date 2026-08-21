import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/widgets/dilaog_utils.dart';
import 'package:salla7ly/features/problem_description/logic/problem_description_cubit.dart';
import 'package:salla7ly/features/problem_description/logic/problem_description_state.dart';

class ProblemDescriptionAiBlocListener extends StatelessWidget {
  const ProblemDescriptionAiBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProblemDescriptionCubit, ProblemDescriptionState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            DialogUtils.showLoading(context: context);
          },

          success: (data) {
            DialogUtils.hideLoading(context);

            context.pushReplacementNamed(
              Routes.aiDetectionScreen,
              arguments: data.id,
              );
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
