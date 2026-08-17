import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/counter_qustion.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/radio_box_question.dart';

class ContainerReview extends StatelessWidget {
  const ContainerReview({super.key, this.isQustionScrean = true});

  final bool isQustionScrean;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 341.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primaryColor, width: 1.6),
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Image.asset(Assets.imagesLogo),
            ),

            SizedBox(height: 10.h),
            if (isQustionScrean) ...[
              RadioQuestion(question: 'هل الفني وصلك؟', options: ['اه', 'لا']),

              SizedBox(height: 10.h),

              RadioQuestion(
                question:
                    'لو انت مستخدم Ai هل السعر ال انت دفعته كان ضمن السعر ال Ai اقترحه عليك ولا لا',
                options: ['اه', 'لا', 'طالب استشاره خبير'],
              ),
            ],
            if (!isQustionScrean) ...[
              CounterQuestion(question: 'حدد سرعة تواصلك بالفني'),

              SizedBox(height: 20.h),

              CounterQuestion(question: 'حدد سرعة إنجاز الفني للمشكله'),

              SizedBox(height: 20.h),

              CounterQuestion(question: 'قيم رضاك عن الخدمة المقدمه'),
            ],
          ],
        ),
      ),
    );
  }
}
