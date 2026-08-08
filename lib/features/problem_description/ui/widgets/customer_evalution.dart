import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class CustomerEvalution extends StatelessWidget {
  CustomerEvalution({
    super.key,
    required this.evalutionMessage
    });

  String evalutionMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Row(
          children: [
            Icon(Icons.person, color: AppColors.primaryColor, size: 36.r),
            horizontalSpace(16.w),
            Text(evalutionMessage, style: AppStyles.semiBold24Primary),
          ],
        ),
      ),
    );
  }
}
