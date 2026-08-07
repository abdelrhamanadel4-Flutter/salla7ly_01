import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 145.w,
          height: 145.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(color: AppColors.primaryColor, width: 1.5.w),
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: Assets.imagesProfileImage,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset(Assets.imagesProfileImage, fit: BoxFit.cover),
            ),
          ),
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
                size: 40.r,
              ),
              onPressed: () {},
            ),
            horizontalSpace(4),
            Text('عبدالرحمن السيد', style: AppStyles.bold24Primary),
          ],
        ),
      ],
    );
  }
}
