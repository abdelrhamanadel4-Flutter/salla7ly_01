import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/theming/assets.dart';

class CommissionsHeader extends StatelessWidget {
  const CommissionsHeader({super.key, this.showBackButton = true});

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: Row(
        children: [
          SvgPicture.asset(Assets.svgsSettingIcon),

          const Spacer(),

          Image.asset(Assets.imagesLogo, fit: BoxFit.fill),

          const Spacer(),

          if (showBackButton)
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(Assets.svgsArrowBack),
            ),
        ],
      ),
    );
  }
}
