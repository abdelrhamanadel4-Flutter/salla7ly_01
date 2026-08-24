import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_app_bar.dart';
import 'package:salla7ly/features/customer_account_in_tech_view/widgets/consultation_price_dialog.dart';
import 'package:salla7ly/features/customer_account_in_tech_view/widgets/contact_customer_dialog.dart';
import 'package:salla7ly/features/home/home_screen.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_header.dart';

class CustomerAccount extends StatelessWidget {
  const CustomerAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            ProfileHeader(isReviewScreen: true, name: 'MEDO'),
            verticalSpace(10.h),
            Container(
              width: double.infinity,
              height: 51.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.primaryColor, width: 1.w),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: AppColors.primaryColor),
                    Text('الاسكندريه,ميامي ', style: AppStyles.mediun12Primary),
                  ],
                ),
              ),
            ),
            verticalSpace(15),

            Container(
              width: double.infinity,
              height: 140.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
                border: BoxBorder.all(color: AppColors.primaryColor),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(Assets.imagesHeaterImage),
            ),
            verticalSpace(8),
            Container(
              width: double.infinity,
              height: 51.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.primaryColor, width: 1.w),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Text('السخان بايظ', style: AppStyles.regular14darkBlue),
              ),
            ),
            verticalSpace(20.h),

            ProfileActionButton(
              title: 'موافق ',
              onPressed: () {
                ConsultationPriceDialog.show(
                  context,
                  onCompleted: () => ContactCustomerDialog.show(
                    context,
                    phoneNumber: '01550516321',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
