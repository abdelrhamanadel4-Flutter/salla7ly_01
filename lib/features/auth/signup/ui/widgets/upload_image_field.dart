import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class UploadImageField extends StatelessWidget {
  final VoidCallback onTap;
  final File? imageFile;

  const UploadImageField({super.key, required this.onTap, this.imageFile});

  @override
  Widget build(BuildContext context) {
    final hasImage = imageFile != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
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
              constraints: BoxConstraints(minHeight: 78.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.whiteColor,
              ),
              padding: EdgeInsets.symmetric(vertical: hasImage ? 8.h : 0),
              child: hasImage
                  ? Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.file(
                              imageFile!,
                              width: 56.w,
                              height: 56.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        Expanded(
                          child: Text(
                            'تم اختيار الصورة، دوس تاني عشان تغيرها',
                            style: AppStyles.semiBold14darkBlue,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.successColor,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: SvgPicture.asset(Assets.svgsUploadImageIcon),
                        ),
                        horizontalSpace(8),
                        Text(
                          'ارفع صورة شخصية',
                          style: AppStyles.semiBold14darkBlue,
                        ),
                      ],
                    ),
            ),
          ),
        ),
        verticalSpace(8),
        Text('اقصي حجم للصورة : 2 ميجا', style: AppStyles.semiBold14darkBlue),
      ],
    );
  }
}
