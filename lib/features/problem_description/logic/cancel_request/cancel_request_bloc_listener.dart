import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/widgets/dilaog_utils.dart';
import 'package:salla7ly/features/problem_description/logic/cancel_request/cancel_request_cubit.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_state.dart';

class CancelRequestBlocListener extends StatelessWidget {
  const CancelRequestBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CancelRequestCubit, PublishState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => DialogUtils.showLoading(context: context),
          success: (_) {
            DialogUtils.hideLoading(context);
            context.pushReplacementNamed(Routes.mainnavigationscreen);
          },
          error: (error) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              message: error.error?.message ?? 'تعذر إلغاء الطلب',
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
