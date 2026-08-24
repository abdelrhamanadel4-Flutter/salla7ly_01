import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/widgets/dilaog_utils.dart';
import 'package:salla7ly/features/problem_description/logic/accept_offer/accept_offer_cubit.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_state.dart';

class AcceptOfferBlocListener extends StatelessWidget {
  const AcceptOfferBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AcceptOfferCubit, PublishState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            DialogUtils.showLoading(context: context);
          },

          success: (data) {
            DialogUtils.hideLoading(context);
            context.pushNamed(Routes.questionscreen);
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
