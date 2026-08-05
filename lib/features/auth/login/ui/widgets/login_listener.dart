import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/widgets/dilaog_utils.dart';
import 'package:salla7ly/features/auth/login/logic/login_cubit.dart';
import 'package:salla7ly/features/auth/login/logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  final ValueChanged<dynamic> onSuccess;

  const LoginBlocListener({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            DialogUtils.showLoading(context: context);
          },
          success: (loginResponse) {
            DialogUtils.hideLoading(context);
            onSuccess(loginResponse);
          },
          error: (apiErrorModel) {
            DialogUtils.hideLoading(context);

            DialogUtils.showMessage(
              context: context,
              type: DialogType.error,
              title: 'حصل خطأ',
              message: apiErrorModel.error?.message ?? "حصل خطأ، حاول تاني",
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
