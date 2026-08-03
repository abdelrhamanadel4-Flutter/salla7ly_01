import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class CriminalRecordField extends StatelessWidget {
  final VoidCallback onTap;

  const CriminalRecordField({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(12.r),
          dashPattern: const [8, 4],
          strokeWidth: 1.5,
          color: AppColors.primaryColor,
        ),
        child: Container(
          width: double.infinity,
          height: 78.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SvgPicture.asset(Assets.svgsCriminalRecordFieldIcon),
              ),
              SizedBox(width: 8),
              Text('فيش وتشبيه', style: AppStyles.regular14darkBlue),
            ],
          ),
        ),
      ),
    );
  }
}
