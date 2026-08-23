import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/features/commissions/widgets/commission_balance_card.dart';
import 'package:salla7ly/features/commissions/widgets/commissions_header.dart';
import 'package:salla7ly/features/commissions/widgets/current_commission_card.dart';
import 'package:salla7ly/features/commissions/widgets/previous_commission_card.dart';

class CommissionsScreen extends StatelessWidget {
  const CommissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommissionsHeader(),
              Text('  سجل العمولات', style: AppStyles.semiBold24Primary),

              SizedBox(height: 15.h),

              const CommissionBalanceCard(),

              SizedBox(height: 15.h),

              const CurrentCommissionCard(),

              SizedBox(height: 10.h),
              Text(' عمولاتك السابقه ', style: AppStyles.semiBold24Primary),

              SizedBox(height: 10.h),

              const PreviousCommissionCard(
                date: 'العمولة لشهر فبراير 2026',
                amount: '100 جنيه',
              ),

              const PreviousCommissionCard(
                date: 'العمولة لشهر فبراير 2026',
                amount: '100 جنيه',
              ),

             
            ],
          ),
        ),
      ),
    );
  }
}
