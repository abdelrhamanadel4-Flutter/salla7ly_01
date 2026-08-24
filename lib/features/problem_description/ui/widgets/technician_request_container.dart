import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';

class TechnicianRequestContainer extends StatelessWidget {
  const TechnicianRequestContainer({
    super.key,
    required this.offer,
    required this.onTap,
  });

  final CustomerOffer offer;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final technician = offer.technician;

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
                            '${technician?.fullName ?? ''} (${technician?.categoryName ?? ''})',
                            style: AppStyles.semiBold14primary,
                          ),
                          horizontalSpace(4),
                          SvgPicture.asset(Assets.svgsVerifiedIcon),
                        ],
                      ),
                      verticalSpace(4),
                      Text(
                        'المسافه : ${technician?.distanceKm ?? 0} كيلومتر',
                        style: AppStyles.semiBold11primary,
                      ),
                      verticalSpace(4),
                      Text(
                        '(+${technician?.totalReviews ?? 0} تقييم)',
                        style: AppStyles.medium11FoundationGrey,
                      ),
                    ],
                  ),
                ],
              ),

              Text(
                'موافق ب ${offer.price ?? 0} \n + ${offer.consultationFee ?? 0} استشارة',
                style: AppStyles.mediun12Primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
