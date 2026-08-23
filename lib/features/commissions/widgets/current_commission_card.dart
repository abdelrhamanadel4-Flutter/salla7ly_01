import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class CurrentCommissionCard extends StatelessWidget {
  const CurrentCommissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            _CommissionCircle(amount: '200'),

            Spacer(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('امتي ينزلي عمولة ؟', style: AppStyles.bold20Primary),

                  Text(
                    'علي كل خمس زيارات تقيمهم اربعه',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.semiBold24Primary.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CommissionCircle extends StatelessWidget {
  final String amount;

  const _CommissionCircle({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 70.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'عمولة',
            style: AppStyles.semiBold20lightGreyColor.copyWith(fontSize: 13.sp),
          ),
          Text(
            '$amount جنيه',
            style: AppStyles.semiBold20lightGreyColor.copyWith(fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
