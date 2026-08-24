import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class OfferHistoryCard extends StatelessWidget {
  final String customerName;
  final String status;
  final String amount;
  final String date;

  const OfferHistoryCard({
    super.key,
    required this.customerName,
    required this.status,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.h,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primaryColor, width: 1.2.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.55),
            blurRadius: 3,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // ==========================================
          // Customer Name
          // ==========================================
          Positioned(
            top: 10.h,
            right: 14.w,
            child: Text(
              customerName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.semiBold14primary.copyWith(fontSize: 15.sp),
            ),
          ),

          // ==========================================
          // "معاينة" Badge
          // ==========================================
          Positioned(
            top: 34.h,
            right: 14.w,
            child: Container(
              width: 90.w,
              height: 27.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'معاينة',
                style: AppStyles.bold16Primary.copyWith(
                  color: AppColors.orangeColor,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ),

          // ==========================================
          // "يفكر" Status
          // ==========================================
          Positioned(
            top: 13.h,
            left: 27.w,
            child: Container(
              width: 90.w,
              height: 27.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.primaryColor, width: 2.w),
              ),
              child: Text(
                status,
                style: AppStyles.bold16Primary.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),

          // ==========================================
          // Amount
          // ==========================================
          Positioned(
            left: 25.w,
            bottom: 16.h,
            child: Text(
              amount,
              style: AppStyles.bold16Primary.copyWith(
                color: AppColors.orangeColor,
                fontSize: 22.sp,
              ),
            ),
          ),

          // ==========================================
          // Date
          // ==========================================
          Positioned(
            right: 14.w,
            bottom: 10.h,
            child: Text(
              date,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bold16Primary.copyWith(
                color: AppColors.primaryColor,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
