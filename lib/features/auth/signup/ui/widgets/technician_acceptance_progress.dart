import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/assets.dart';

class TechnicianAcceptanceProgress extends StatelessWidget {
  TechnicianAcceptanceProgress({super.key});

  double progress = 0.25;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(Assets.imagesLogo),
          SizedBox(
            width: 220.w,
            height: 220.h,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 24,
              backgroundColor: AppColors.progressIndicatorColor,
              color: AppColors.primaryColor,
            ),
          ),

          Image.asset(Assets.imagesLogo, width: 120, height: 120),
        ],
      ),
    );
  }
}
