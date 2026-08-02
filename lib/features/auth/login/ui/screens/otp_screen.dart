import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
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
                onPressed: () {},
                text: 'تمام',
                backgroundColor: AppColors.primaryColor,
                textStyle: AppStyles.bold16LightGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
