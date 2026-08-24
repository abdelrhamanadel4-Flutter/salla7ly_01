import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';

class TechDetails extends StatelessWidget {
  const TechDetails({super.key, required this.technician});

  final OfferTechnician? technician;

  @override
  Widget build(BuildContext context) {
    final rating = technician?.overallRating ?? 0;
    final phone = technician?.phone;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 145.h),
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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '(${technician?.categoryName ?? ''})',
                  style: AppStyles.bold16Primary,
                ),
                horizontalSpace(8),
                SvgPicture.asset(Assets.svgsRateIcon),
                horizontalSpace(8),
                Text(
                  'تقييم ${rating.toStringAsFixed(2)}',
                  style: AppStyles.mediun12Primary,
                ),
              ],
            ),
            verticalSpace(8),
            Text(
              'مدينة : ${technician?.city ?? ''}',
              style: AppStyles.mediun12Primary,
            ),
            verticalSpace(8),
            Row(
              children: [
                SvgPicture.asset(Assets.svgsLocIcon),
                horizontalSpace(4),
                Expanded(
                  child: Text(
                    technician?.address ?? '',
                    style: AppStyles.mediun12Primary,
                  ),
                ),
              ],
            ),
            if (phone != null && phone.isNotEmpty) ...[
              verticalSpace(8),
              Row(
                children: [
                  SvgPicture.asset(Assets.svgsPhoneIcon),
                  horizontalSpace(4),
                  Text(phone, style: AppStyles.mediun12Primary),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
