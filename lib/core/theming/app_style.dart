import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla7ly/core/helpers/fontweight.dart';
import 'package:salla7ly/core/theming/app_color.dart';

class AppStyles {
  static final TextStyle bold16LightGrey = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.lightGreyColor,
  );
  static final TextStyle mediun16LightGrey = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.lightGreyColor,
  );
  static final TextStyle mediun12Primary = GoogleFonts.cairo(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.primaryColor,
  );
  static final TextStyle bold24Primary = GoogleFonts.cairo(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primaryColor,
  );
  static final TextStyle semiBold24Primary = GoogleFonts.cairo(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.primaryColor,
  );
  static final TextStyle semiBold14darkBlue = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.darkBlueColor,
  );
  static final TextStyle semiBold14primary = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.primaryColor,
  );
  static final TextStyle semiBold11primary = GoogleFonts.cairo(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.primaryColor,
  );
  static final TextStyle regular14darkBlue = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.darkBlueColor,
  );
  static final TextStyle bold14darkBlue = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.darkBlueColor,
  );
  static final TextStyle bold20Primary = GoogleFonts.cairo(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primaryColor,
  );
  static final TextStyle bold16Primary = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primaryColor,
  );
  static final TextStyle medium16Primary = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.primaryColor,
  );
  static final TextStyle regular14Grey = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.greyColor,
  );
  static final TextStyle medium11FoundationGrey = GoogleFonts.cairo(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.foundationGrey,
  );
}
