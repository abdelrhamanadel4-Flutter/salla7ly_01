import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/features/offers/widgets/offer_card.dart';
import 'package:salla7ly/features/offers/widgets/offers_header.dart';

class RequsetsScreen extends StatelessWidget {
  const RequsetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OffersHeader(),

              SizedBox(height: 20.h),

              Text('طلبات العملاء ', style: AppStyles.semiBold24Primary),
              SizedBox(height: 10.h),

              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.customeraccount);
                },
                child: const OfferCard(
                  technicianName: 'محمد احمد',
                  serviceName: 'المسافه : 2 كيلومتر',
                  date: '',
                ),
              ),

              const OfferCard(
                technicianName: 'محمد احمد',
                serviceName: 'المسافه : 2 كيلومتر',
                date: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
