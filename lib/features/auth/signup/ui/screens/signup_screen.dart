import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/helpers/validatores.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_ftom_filed.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? NameController;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.imagesLogo),
              verticalSpace(8),
              Text('إعمل حساب جديد', style: AppStyles.bold24Primary),
              verticalSpace(16),
              CustomTextFormField(
                controller: NameController,
                validator: (value) {
                  return AppValidators.validateFullName(value);
                },
                hintStyle: AppStyles.semiBold14darkBlue,
                hintText: 'دخل اسمك',
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: SvgPicture.asset(Assets.svgsNameIcon),
                ),
              ),
              verticalSpace(16),
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
