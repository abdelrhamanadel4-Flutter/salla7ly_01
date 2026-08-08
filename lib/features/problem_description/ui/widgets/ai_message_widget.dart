import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/problem_container_painter.dart';

class AiMessageWidget extends StatelessWidget {
  AiMessageWidget({
    super.key,
    required this.message
    });

  String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.svgsAiIcon),
        horizontalSpace(8),
        Expanded(
          child: SizedBox(
            height: 88.h,
            child: CustomPaint(
              painter: ProblemContainerPainter(),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 45.w),
                  child: Text(
                    message,
                    style: AppStyles.medium16Primary,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
