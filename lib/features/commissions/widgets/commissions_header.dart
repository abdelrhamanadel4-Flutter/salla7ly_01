import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class CommissionsHeader extends StatelessWidget {
  const CommissionsHeader({super.key});

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
