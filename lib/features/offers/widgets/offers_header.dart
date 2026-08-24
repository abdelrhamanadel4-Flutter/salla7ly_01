import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class OffersHeader extends StatelessWidget {
  const OffersHeader({
    super.key,
    this.showBackButton = true,
  });

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          if (showBackButton)
            Positioned(
              left: 8.w,
              top: 8.h,
              child: GestureDetector(
                onTap: context.pop,
                child: SvgPicture.asset(Assets.svgsArrowBack),
              ),
            ),

          // Settings
          Positioned(
            right: 8.w,
            top: 8.h,
            child: SvgPicture.asset(Assets.svgsSettingIcon),
          ),

          // Logo
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Image.asset(
                  Assets.imagesLogo,
                  width: 244.w,
                  height: 140.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          // Lightning
          Positioned(
            left: 20.w,
            bottom: 12.h,
            child: Icon(
              Icons.flash_on,
              color: const Color(0xFFFF6B00),
              size: 70.r,
            ),
          ),

          // Wrench
          Positioned(
            right: 20.w,
            bottom: 10.h,
            child: Transform.rotate(
              angle: -0.55,
              child: Icon(
                Icons.build,
                color: AppColors.primaryColor,
                size: 70.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
