import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/technician_acceptance_progress.dart';

class WaitingRequestScreen extends StatelessWidget {
  const WaitingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: 244.w,
                    height: 140.h,
                  ),
                ),
                verticalSpace(8),
                Text('طلب فني خبير', style: AppStyles.bold20Primary),
                verticalSpace(40),
                TechnicianAcceptanceProgress(),
                verticalSpace(40),
                Center(
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      radius: Radius.circular(4.r),
                      dashPattern: const [8, 4],
                      strokeWidth: 1.5,
                      color: AppColors.primaryColor,
                    ),
                    child: Container(
                      width: 275.w,
                      constraints: BoxConstraints(minHeight: 50.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Center(
                        child: Text(
                          'استني طلبات الفنين',
                          style: AppStyles.bold20Primary,
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(24),
                CustomElevatedButton(text: 'خرجني', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
