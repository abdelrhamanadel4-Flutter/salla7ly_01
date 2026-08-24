import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/features/commissions/widgets/commissions_header.dart';
import 'package:salla7ly/features/offers_history/widgets/offer_history_card.dart';

class OffersHistoryScreen extends StatelessWidget {
  const OffersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(5.w, 4.h, 5.w, 8.h),
          child: Column(
            children: [
              const CommissionsHeader(),
              Text('سجل العروض السابقة', style: AppStyles.semiBold24Primary),

              SizedBox(height: 10.h),
              Text(
                'متابعة حالة العروض والأسعار اللي قدمتها للعملاء',
                style: AppStyles.semiBold24Primary.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.greyColor,
                ),
              ),

              SizedBox(height: 18.h),

              const OfferHistoryCard(
                customerName: 'احمد محمود',
                status: 'بيفكر',
                amount: '500 جنيه',
                date: 'يوم 14/8 الساعة 9',
              ),
              const OfferHistoryCard(
                customerName: 'احمد محمود',
                status: 'اختار حد تاني',
                amount: '500 جنيه',
                date: 'يوم 14/8 الساعة 9',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
