import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  Color? backgroundColor;
  TextStyle? textStyle;
  void Function()? onPressed;
  CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        backgroundColor: backgroundColor?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
      ),
      child: SizedBox(
        height: 52.h,
        width: 398.w,
        child: Center(child: AutoSizeText(text, style: textStyle ?? AppStyles.bold16LightGrey)),
      ),
    );
  }
}
