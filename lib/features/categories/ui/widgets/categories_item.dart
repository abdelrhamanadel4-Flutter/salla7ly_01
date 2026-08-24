import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class CategoriesItem extends StatelessWidget {
  CategoriesItem({super.key, required this.categoryName, this.onTap});

  String categoryName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 120.w,
        height: 84.h,
        decoration: BoxDecoration(
          color: AppColors.darkBlueColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primaryColor, width: 1.w),
        ),
        child: Center(
          child: Text(categoryName, style: AppStyles.mediun16LightGrey),
        ),
      ),
    );
  }
}
