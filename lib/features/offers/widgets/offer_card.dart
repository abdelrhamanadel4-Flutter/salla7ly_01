import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class OfferCard extends StatelessWidget {
  final String technicianName;
  final String serviceName;
  final String date;

  const OfferCard({
    super.key,
    required this.technicianName,
    required this.serviceName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      margin: EdgeInsets.only(bottom: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryColor, width: 1.5.w),
      ),
      child: Row(
        children: [
          // User icon
          SvgPicture.asset(Assets.svgsIconAvater),

          SizedBox(width: 7.w),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  technicianName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.semiBold14primary,
                ),

                SizedBox(height: 1.h),

                Text(
                  serviceName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.semiBold14primary,
                ),
              ],
            ),
          ),

          Text(date, style: AppStyles.mediun12Primary),
          SizedBox(width: 30.w),
        ],
      ),
    );
  }
}
