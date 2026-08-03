import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

enum DialogType { success, error, warning, info }

class _DialogTypeStyle {
  final Color color;
  final Color softColor;
  final IconData icon;
  const _DialogTypeStyle(this.color, this.softColor, this.icon);
}

const Map<DialogType, _DialogTypeStyle> _dialogStyles = {
  DialogType.success: _DialogTypeStyle(
    AppColors.successColor,
    AppColors.successSoft,
    Icons.check_circle_rounded,
  ),
  DialogType.error: _DialogTypeStyle(
    AppColors.redColor,
    AppColors.errorSoft,
    Icons.error_rounded,
  ),
  DialogType.warning: _DialogTypeStyle(
    AppColors.warningColor,
    AppColors.warningSoft,
    Icons.warning_rounded,
  ),
  DialogType.info: _DialogTypeStyle(
    AppColors.primaryColor,
    AppColors.infoSoft,
    Icons.info_rounded,
  ),
};

class DialogUtils {
  /// Shows a centered, rounded loading dialog with the app's primary color.
  static void showLoading({
    required BuildContext context,
    String message = 'جاري التحميل...',
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.12),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 28.h,
                  width: 28.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Flexible(
                  child: Text(
                    message,
                    style: AppStyles.semiBold14darkBlue,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  /// Shows a rounded feedback dialog with a colored icon that matches [type].
  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    DialogType type = DialogType.error,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    final style = _dialogStyles[type]!;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(24.w, 28.h, 24.w, 20.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.12),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 64.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    color: style.softColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(style.icon, color: style.color, size: 34.sp),
                ),
                SizedBox(height: 16.h),
                if (title != null && title.isNotEmpty) ...[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppStyles.bold20Primary,
                  ),
                  SizedBox(height: 8.h),
                ],
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppStyles.semiBold14darkBlue,
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    if (negActionName != null)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            negAction?.call();
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            side: const BorderSide(
                              color: AppColors.primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            negActionName,
                            style: AppStyles.semiBold14darkBlue,
                          ),
                        ),
                      ),
                    if (negActionName != null && posActionName != null)
                      SizedBox(width: 12.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          posAction?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: style.color,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          posActionName ?? 'تمام',
                          style: AppStyles.bold16LightGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
