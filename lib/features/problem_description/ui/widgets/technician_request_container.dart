import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class TechnicianRequestContainer extends StatelessWidget {
  TechnicianRequestContainer({
    super.key,
    required this.technicianName,
    required this.technicianField,
    required this.distance,
    required this.noOfRates,
    required this.price,
    required this.priceOfConsultation,
    required this.onTap
  });

  final String technicianName;
  final String technicianField;
  final num distance;
  final int noOfRates;
  final num price;
  final num priceOfConsultation;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 75.h,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.primaryColor, width: 1.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Center(child: SvgPicture.asset(Assets.svgsTechnicianIcon)),
                  horizontalSpace(4),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            '$technicianName ($technicianField)',
                            style: AppStyles.semiBold14primary,
                          ),
                          horizontalSpace(4),
                          SvgPicture.asset(Assets.svgsVerifiedIcon),
                        ],
                      ),
                      verticalSpace(4),
                      Text(
                        'المسافه : $distance كيلومتر',
                        style: AppStyles.semiBold11primary,
                      ),
                      verticalSpace(4),
                      Text(
                        '(+$noOfRates تقييم)',
                        style: AppStyles.medium11FoundationGrey,
                      ),
                    ],
                  ),
                ],
              ),
      
              Text(
                'موافق ب $price \n + $priceOfConsultation استشارة',
                style: AppStyles.mediun12Primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
