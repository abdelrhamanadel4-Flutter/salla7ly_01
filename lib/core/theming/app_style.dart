import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla7ly/core/helpers/fontweight.dart';
import 'package:salla7ly/core/theming/app_color.dart';

class AppStyles {
  static final TextStyle bold16LightGreyButtonStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.lightGreyColor,
  );
  static final TextStyle bold24Primary = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primaryColor,
  );
}

