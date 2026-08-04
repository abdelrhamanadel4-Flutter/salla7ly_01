import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/technician_acceptance_progress.dart';

class TechnicianAcceptanceScreen extends StatelessWidget {
  const TechnicianAcceptanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 56.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TechnicianAcceptanceProgress(),
                verticalSpace(72),
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    radius: Radius.circular(4.r),
                    dashPattern: const [8, 4],
                    strokeWidth: 1.5,
                    color: AppColors.primaryColor,
                  ),
                  child: Container(
                    width: 267.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Center(
                      child: Text(
                        'معلش استنا وهنرد عليك بكرا',
                        style: AppStyles.bold16Primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
