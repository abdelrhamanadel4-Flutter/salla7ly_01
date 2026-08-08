import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/ai_message_widget.dart';

class AiDetectionScreen extends StatelessWidget {
  const AiDetectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.imagesLogo),
                verticalSpace(8),
                Text('ال Ai بيقول ......', style: AppStyles.bold24Primary),
                verticalSpace(16),
                AiMessageWidget(message: 'من وجهة نظري مشكلتك صغيرة'),
                verticalSpace(16),
                AiMessageWidget(
                  message:
                      'ده معناه ان سعرها يتراوح بين......\n 500 - 1000 جنيه',
                ),
                verticalSpace(16),
                AiMessageWidget(message: 'هل ابعت طلب للفنين المتاحين ؟؟؟؟'),
                verticalSpace(16),
                CustomElevatedButton(
                  text: 'ابعت',
                  onPressed: () {
                    context.pushReplacementNamed(
                      Routes.requestTechnicianScreen,
                    );
                  },
                ),
                verticalSpace(16),
                CustomElevatedButton(text: 'خرجني', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
