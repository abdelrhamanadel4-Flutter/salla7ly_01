import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_request.dart';
import 'package:salla7ly/features/auth/login/logic/login_cubit.dart';
import 'package:salla7ly/features/auth/login/ui/widgets/login_listener.dart';
import 'package:salla7ly/features/auth/login/ui/widgets/otp_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Image.asset(Assets.imagesLogo),
              verticalSpace(16),
              Align(
                alignment: Alignment.centerRight,
                child: Text('😊 دخل الرمز', style: AppStyles.bold24Primary),
              ),
              verticalSpace(20),
              OtpWidget(),
              verticalSpace(32),
              CustomElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().verifyOtp(VerifyOtpRequest(
                    phone: context.read<LoginCubit>().phoneNoController?.text ?? '',
                    otpCode: context.read<LoginCubit>().otpcontroller.text,
                  ));
                },
                text: 'تمام',
                backgroundColor: AppColors.primaryColor,
                textStyle: AppStyles.bold16LightGrey,
              ),
              LoginBlocListener(
                onSuccess: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.homeScreen,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
