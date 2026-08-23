import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class CommissionBalanceCard extends StatelessWidget {
  const CommissionBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'عمولاتك الشهر ده لغاية دلوقتي  ',
            style: AppStyles.semiBold20lightGreyColor,
          ),

          SizedBox(height: 1.h),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '500',
                  style: AppStyles.bold20Primary.copyWith(
                    color: const Color(0xFFFF6B00),
                    fontSize: 30.sp,
                  ),
                ),
                TextSpan(
                  text: ' جنيه',
                  style: AppStyles.bold20Primary.copyWith(
                    color: const Color(0xFFFF6B00),
                    fontSize: 30.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
