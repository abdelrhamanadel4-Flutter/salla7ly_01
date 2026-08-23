import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/widgets/dilaog_utils.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_cubit.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_state.dart';


class PublishBlocListener extends StatelessWidget {
  const PublishBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PublishCubit, PublishState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            
          },

          success: (data) {
            DialogUtils.hideLoading(context);

            final technicianCount =
                data.data?.technicianCount ?? 0;

            if (technicianCount == 0) {
              context.pushReplacementNamed(
                Routes.waitingRequestScreen,
              );
            } else {
              // هنا بعدين هنبدأ Offers
            }
          },

          error: (error) {
            DialogUtils.hideLoading(context);

            DialogUtils.showMessage(
              context: context,
              type: DialogType.error,
              title: 'حصل خطأ',
              message:
                  error.error?.message ?? 'حصل خطأ، حاول تاني',
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}