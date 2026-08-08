import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/technician_request_container.dart';

class RequestTechnicianScreen extends StatelessWidget {
  const RequestTechnicianScreen({super.key});

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
                verticalSpace(16),
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
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1.w,
                    ),
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    child: Text(
                      'السخان بايظ',
                      style: AppStyles.regular14darkBlue,
                    ),
                  ),
                ),
                verticalSpace(16),
                TechnicianRequestContainer(
                  technicianName: 'محمد احمد',
                  technicianField: 'سباك',
                  distance: 2,
                  noOfRates: 120,
                  price: 200,
                  priceOfConsultation: 100,
                  onTap: () {
                    context.pushReplacementNamed(
                      Routes.techProfileCustomerViewScreen,
                    );
                  },
                ),
                verticalSpace(16),
                TechnicianRequestContainer(
                  technicianName: 'محمد احمد',
                  technicianField: 'سباك',
                  distance: 2,
                  noOfRates: 120,
                  price: 200,
                  priceOfConsultation: 100,
                  onTap: () {},
                ),
                verticalSpace(16),
                TechnicianRequestContainer(
                  technicianName: 'محمد احمد',
                  technicianField: 'سباك',
                  distance: 2,
                  noOfRates: 120,
                  price: 200,
                  priceOfConsultation: 100,
                  onTap: () {},
                ),
                verticalSpace(16),
                TechnicianRequestContainer(
                  technicianName: 'محمد احمد',
                  technicianField: 'سباك',
                  distance: 2,
                  noOfRates: 120,
                  price: 200,
                  priceOfConsultation: 100,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
