import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/features/offers/widgets/offer_card.dart';
import 'package:salla7ly/features/offers/widgets/offers_header.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

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

              Text('عروض', style: AppStyles.semiBold24Primary),
              SizedBox(height: 10.h),

              const OfferCard(
                technicianName: 'محمد احمد',
                serviceName: 'المسافه : 2 كيلومتر',
                date: 'موافق',
              ),

              const OfferCard(
                technicianName: 'محمد احمد',
                serviceName: 'صيانة تكييف - سباكة',
                date: 'منذ يوم',
              ),

              const OfferCard(
                technicianName: 'محمد احمد',
                serviceName: 'صيانة تكييف - سباكة',
                date: 'منذ يوم',
              ),

              const OfferCard(
                technicianName: 'محمد احمد',
                serviceName: 'صيانة تكييف - سباكة',
                date: 'منذ يوم',
              ),

              const OfferCard(
                technicianName: 'محمد احمد',
                serviceName: 'صيانة تكييف - سباكة',
                date: 'منذ يوم',
              ),

              const OfferCard(
                technicianName: 'محمد احمد',
                serviceName: 'صيانة تكييف - سباكة',
                date: 'منذ يوم',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
