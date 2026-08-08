import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/assets.dart';

class TechnicianAcceptanceProgress extends StatelessWidget {
  const TechnicianAcceptanceProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 220.w,
            height: 220.h,
            child: CircularProgressIndicator(
              strokeWidth: 24.w,
              backgroundColor: AppColors.progressIndicatorColor,
              color: AppColors.primaryColor,
            ),
          ),

          Image.asset(Assets.imagesLogo),
        ],
      ),
    );
  }
}
