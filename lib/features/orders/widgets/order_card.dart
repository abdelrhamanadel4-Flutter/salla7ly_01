import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class OrderCard extends StatelessWidget {
  final String messagename;
  final String time;
  final String price;

  const OrderCard({
    super.key,
    required this.messagename,
    required this.time,
    required this.price,
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
          SvgPicture.asset(Assets.svgsOrderIcon),

          SizedBox(width: 7.w),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messagename,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.semiBold14primary,
                ),

                SizedBox(height: 1.h),

                Row(
                  children: [
                    Text(
                      time,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.semiBold14primary,
                    ),
                    Text(
                      price,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.semiBold14primary,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(width: 30.w),
        ],
      ),
    );
  }
}
