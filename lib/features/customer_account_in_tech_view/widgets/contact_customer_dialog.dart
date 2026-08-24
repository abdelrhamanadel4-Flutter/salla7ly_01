import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class ContactCustomerDialog extends StatelessWidget {
  const ContactCustomerDialog({
    super.key,
    required this.phoneNumber,
    this.onCall,
  });

  final String phoneNumber;
  final VoidCallback? onCall;

  static Future<void> show(
    BuildContext context, {
    required String phoneNumber,
    VoidCallback? onCall,
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) =>
          ContactCustomerDialog(phoneNumber: phoneNumber, onCall: onCall),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(minWidth: 0, maxWidth: 343.w),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: 343.w,
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 20.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.primaryColor, width: 1.2.w),
            boxShadow: const [
              BoxShadow(
                color: AppColors.primaryColor,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Assets.imagesLogo,
                height: 105.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 8.h),
              Text(
                'تواصل مع العميل',
                style: AppStyles.bold18Primary.copyWith(fontSize: 28.sp),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        phoneNumber,
                        style: AppStyles.regular14darkBlue.copyWith(
                          fontSize: 32.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  IconButton(
                    onPressed: onCall,
                    icon: Icon(
                      Icons.phone_in_talk_rounded,
                      color: AppColors.primaryColor,
                      size: 50.sp,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              SizedBox(
                height: 50.h,
                width: 170.w,
                child: ElevatedButton(
                  onPressed: () =>
                      context.pushNamed(Routes.mainnavigationscreentech),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                  ),
                  child: Text(
                    'تمام',
                    style: AppStyles.bold16LightGrey.copyWith(fontSize: 18.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
