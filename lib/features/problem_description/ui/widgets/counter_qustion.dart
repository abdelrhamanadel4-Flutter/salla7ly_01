import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class CounterQuestion extends StatefulWidget {
  const CounterQuestion({super.key, required this.question});

  final String question;

  @override
  State<CounterQuestion> createState() => _CounterQuestionState();
}

class _CounterQuestionState extends State<CounterQuestion> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          widget.question,
          style: AppStyles.bold16Primary,
          textAlign: TextAlign.right,
        ),

        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if (value > 0) {
                  setState(() {
                    value--;
                  });
                }
              },
              child: Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.primaryColor,
                  size: 20.sp,
                ),
              ),
            ),

            SizedBox(width: 15.w),

            Container(
              width: 103.w,
              height: 33.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xffE1E8F8),
                borderRadius: BorderRadius.circular(9.r),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: Text('$value', style: AppStyles.bold16Primary),
            ),

            SizedBox(width: 15.w),

            GestureDetector(
              onTap: () {
                if (value < 10) {
                  setState(() {
                    value++;
                  });
                }
              },
              child: Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
