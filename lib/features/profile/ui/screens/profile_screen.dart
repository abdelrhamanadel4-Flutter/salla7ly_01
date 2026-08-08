import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double credit = 0.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileHeader(),
                verticalSpace(40),
                Container(
                  width: double.infinity,
                  height: 64.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 1),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.svgsCashIcon),
                      horizontalSpace(8),
                      Text('محفظتي', style: AppStyles.semiBold24Primary),
                      horizontalSpace(8),
                      Text("$credit", style: AppStyles.semiBold24Primary),
                    ],
                  ),
                ),
                verticalSpace(40),
                CustomElevatedButton(
                  text: 'قولنا مشكلتك',
                  onPressed: () {
                    context.pushReplacementNamed(Routes.categoriesScreen);
                  },
                ),
                verticalSpace(8),
                CustomElevatedButton(text: 'اشحن', onPressed: () {}),
                verticalSpace(8),
                CustomElevatedButton(text: 'طلباتك السابقه', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
