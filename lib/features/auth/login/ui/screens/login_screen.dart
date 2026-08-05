import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/helpers/validatores.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_ftom_filed.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_requset.dart';
import 'package:salla7ly/features/auth/login/logic/login_cubit.dart';
import 'package:salla7ly/features/auth/login/ui/widgets/login_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.imagesLogo),
                verticalSpace(8),
                Text('صباح الفل !', style: AppStyles.bold24Primary),
                verticalSpace(16),
                Form(
                  key: context.read<LoginCubit>().formKey,
                  child: CustomTextFormField(
                    controller: context.read<LoginCubit>().phoneNoController,
                    validator: (value) {
                      return AppValidators.validatePhoneNumber(value);
                    },
                    hintStyle: AppStyles.semiBold14darkBlue,
                    hintText: 'دخل رقمك',
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: SvgPicture.asset(Assets.svgsPhoneIcon),
                    ),
                  ),
                ),
                verticalSpace(16),
                CustomElevatedButton(
                  onPressed: () {
                    context.read<LoginCubit>().requestOtp(
                      RequsetOtpRequset(
                        phone:
                            context.read<LoginCubit>().phoneNoController?.text ??
                            '',
                      ),
                    );
                  },
                  text: 'تمام',
                  backgroundColor: AppColors.primaryColor,
                  textStyle: AppStyles.bold16LightGrey,
                ),
                LoginBlocListener(
                  onSuccess: (_) {
                    Navigator.pushNamed(
                      context,
                      Routes.otpScreen,
                      arguments: context.read<LoginCubit>(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
