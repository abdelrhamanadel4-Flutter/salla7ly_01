import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_form_filed.dart';

class ProblemDescriptionScreen extends StatelessWidget {
  const ProblemDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController problemController = TextEditingController();
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
                Text('اوصف مشكلتك ل Ai', style: AppStyles.bold24Primary),
                verticalSpace(24),
                CustomTextFormField(
                  controller: problemController,
                  hintStyle: AppStyles.semiBold14darkBlue,
                  hintText: 'قول مشكلتك',
                ),
                verticalSpace(8),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 140.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(32),
                      border: BoxBorder.all(color: AppColors.darkBlueColor),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.svgsCameraIcon),
                        verticalSpace(4),
                        Text(
                          'حط صورة \n للمشكلة',
                          style: AppStyles.semiBold14darkBlue,
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(16),
                CustomElevatedButton(
                  text: 'تمام',
                  onPressed: () {
                    context.pushReplacementNamed(Routes.aiDetectionScreen);
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
