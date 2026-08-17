import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/widgets/custom_app_bar.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_form_filed.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/container_review.dart';

class RequestReviewScreen extends StatelessWidget {
  const RequestReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerReview(isQustionScrean: false),
            verticalSpace(20.h),

            Text('سيب تعليقك يقيم الفني', style: AppStyles.bold16Primary),
            verticalSpace(10.h),

            CustomTextFormField(
              hintText: 'سيب تعليقك',
              hintStyle: AppStyles.regular14Grey,
            ),
            verticalSpace(20.h),
            CustomElevatedButton(
              text: 'ارفع تقيمك',
              onPressed: () {
                context.pushNamed(Routes.mainnavigationscreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
