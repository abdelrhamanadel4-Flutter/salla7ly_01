import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/features/offers/widgets/offers_header.dart';
import 'package:salla7ly/features/orders/widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

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

              Text('طلباتك السابقه', style: AppStyles.semiBold24Primary),
              SizedBox(height: 10.h),

              const OrderCard(
                messagename: ' محمد احمد صلحلك المسوره المكسوره عندك',
                time: ' يوم 14/8 الساعه 9   ',
                price: 'سعرها : 400 جنيه',
              ),

              const OrderCard(
                messagename: ' محمد احمد صلحلك المسوره المكسوره عندك',
                time: ' يوم 14/8 الساعه 9   ',
                price: 'سعرها : 400 جنيه',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
