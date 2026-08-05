import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class CriminalRecordField extends StatelessWidget {
  final VoidCallback onTap;

  final File? file;

  const CriminalRecordField({super.key, required this.onTap, this.file});

  bool get _isPdf => file != null && file!.path.toLowerCase().endsWith('.pdf');

  @override
  Widget build(BuildContext context) {
    final hasFile = file != null;

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
          constraints: BoxConstraints(minHeight: 78.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.whiteColor,
          ),
          padding: EdgeInsets.symmetric(vertical: hasFile ? 8.h : 0),
          child: hasFile
              ? Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: _isPdf
                          ? Icon(
                              Icons.picture_as_pdf_rounded,
                              color: AppColors.primaryColor,
                              size: 36.sp,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.file(
                                file!,
                                width: 56.w,
                                height: 56.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    horizontalSpace(8),
                    Expanded(
                      child: Text(
                        file!.path.split(Platform.pathSeparator).last,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.regular14darkBlue,
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
                      child: SvgPicture.asset(
                        Assets.svgsCriminalRecordFieldIcon,
                      ),
                    ),
                    horizontalSpace(8),
                    Text('فيش وتشبيه', style: AppStyles.regular14darkBlue),
                  ],
                ),
        ),
      ),
    );
  }
}
