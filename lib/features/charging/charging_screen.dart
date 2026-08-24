import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/features/charging/charging_offer_item.dart';
import 'package:salla7ly/features/charging/add_charging_price_screen.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';

class ChargingScreen extends StatelessWidget {
  const ChargingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chargingOffers = ['300', '500', '1000', 'اختيار تاني'];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(Assets.svgsSettingIcon),
                    GestureDetector(
                      onTap: context.pop,
                      child: SvgPicture.asset(Assets.svgsArrowBack),
                    ),
                  ],
                ),
                Image.asset(Assets.imagesLogo),
                verticalSpace(8),
                Text('عروض الشحن', style: AppStyles.bold24Primary),
                verticalSpace(24),
                Container(
                  width: double.infinity,
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
                      vertical: 16.h,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: chargingOffers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.w,
                        mainAxisSpacing: 14.h,
                        childAspectRatio: 1.55,
                      ),
                      itemBuilder: (context, index) {
                        return ChargingOfferItem(
                          chargingOffer: chargingOffers[index],
                          onTap: () {
                            if (index == chargingOffers.length - 1) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const AddChargingPriceScreen(),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
