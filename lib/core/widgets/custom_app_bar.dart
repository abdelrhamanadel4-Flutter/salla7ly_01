import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/theming/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        Row(
          children: [
            GestureDetector(
              child: SvgPicture.asset(Assets.svgsArrowBack),
              onTap: () {
                context.pop();
              },
            ),
            SizedBox(width: 20.w),
          ],
        ),
      ],
      leading: Row(
        children: [
          Expanded(child: SizedBox(width: 20.w)),
          SvgPicture.asset(Assets.svgsSettingIcon),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
