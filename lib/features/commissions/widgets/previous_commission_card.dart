import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class PreviousCommissionCard extends StatelessWidget {
  final String date;
  final String amount;

  const PreviousCommissionCard({
    super.key,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      margin: EdgeInsets.only(bottom: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 1),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'عمولة',
                    style: AppStyles.semiBold20lightGreyColor.copyWith(
                      fontSize: 10.sp,
                    ),
                  ),
                  Text(
                    amount,
                    style: AppStyles.semiBold20lightGreyColor.copyWith(
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 8.w),

            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.bold16Primary,
                ),
              ),
            ),

            SizedBox(width: 6.w),
            SvgPicture.asset(
              Assets.svgsComssions,
              color: AppColors.primaryColor,
              width: 30.w,
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
