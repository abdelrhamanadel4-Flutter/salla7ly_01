import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/constansts.dart';
import 'package:salla7ly/core/helpers/shared_pref_helper.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/features/auth/login/domain/entity/refresh_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_response.dart';
import 'package:salla7ly/features/auth/login/logic/login_cubit.dart';
import 'package:salla7ly/features/auth/login/logic/login_state.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/technician_acceptance_progress.dart';

class TechnicianAcceptanceScreen extends StatefulWidget {
  const TechnicianAcceptanceScreen({super.key});

  @override
  State<TechnicianAcceptanceScreen> createState() =>
      _TechnicianAcceptanceScreenState();
}

class _TechnicianAcceptanceScreenState
    extends State<TechnicianAcceptanceScreen> {
  static const Duration _pollInterval = Duration(seconds: 15);
  static const String _waitingForApprovalState = 'WAITING_FOR_APPROVAL';

  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    _pollTimer = Timer.periodic(_pollInterval, (_) => _checkAccountStatus());
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _checkAccountStatus() async {
    final refreshToken = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.refreshToken,
    );
    if (refreshToken.isEmpty || !mounted) return;

    context.read<LoginCubit>().refreshOtp(
      RefreshOtpRequset(refreshToken: refreshToken),
    );
  }

  void _handleRefreshResult(VerifyOtpResponse? response) {
    final accountState = response?.data?.accountState;
    if (accountState == null || accountState == _waitingForApprovalState) {
      return;
    }
    _pollTimer?.cancel();
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.homeScreen,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current is Success,
      listener: (context, state) {
        state.whenOrNull(
          success: (data) => _handleRefreshResult(data as VerifyOtpResponse?),
        );
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 56.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TechnicianAcceptanceProgress(),
                  verticalSpace(72),
                  DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      radius: Radius.circular(4.r),
                      dashPattern: const [8, 4],
                      strokeWidth: 1.5,
                      color: AppColors.primaryColor,
                    ),
                    child: Container(
                      width: 267.w,
                      constraints: BoxConstraints(minHeight: 50.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Center(
                        child: Text(
                          'معلش استنا وهنرد عليك بكرا',
                          style: AppStyles.bold16Primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
