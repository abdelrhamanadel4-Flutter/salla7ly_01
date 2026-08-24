import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class BottomNavBarTech extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBarTech({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(index: 0, icon: Assets.svgsIconHome, label: 'الرئيسية'),
          _buildItem(index: 1, icon: Assets.svgsComssions, label: 'سجلك'),

          _buildItem(index: 2, icon: Assets.svgsOffers, label: 'عروض'),
        ],
      ),
    );
  }

  Widget _buildItem({
    required int index,
    required String icon,
    required String label,
  }) {
    final bool isSelected = currentIndex == index;

    if (isSelected) {
      return GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          width: 95.w,
          height: 70.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 1.6),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 30.w,
                height: 30.h,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),

              SizedBox(height: 3.h),

              Text(label, style: AppStyles.semiBold14primary),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => onTap(index),
      child: SizedBox(
        width: 70.w,
        height: 65.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 25.w,
              height: 25.h,
              colorFilter: ColorFilter.mode(
                AppColors.greyColor,
                BlendMode.srcIn,
              ),
            ),

            SizedBox(height: 3.h),

            Text(
              label,
              style: AppStyles.regular14Grey.copyWith(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
