import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_app_bar.dart';

class KindOfProblemScreen extends StatelessWidget {
  const KindOfProblemScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.imagesLogo),
                verticalSpace(8),
                Text('ازاي تحل مشكلتك', style: AppStyles.bold24Primary),
                verticalSpace(40),
                CustomElevatedButton(
                  text: 'اوصفهالنا بالAi',
                  onPressed: () {
                    context.pushReplacementNamed(
                      Routes.problemDescriptionAiScreen,
                      arguments: categoryId,
                    );
                  },
                ),
                verticalSpace(16),
                CustomElevatedButton(
                  text: 'طلب استشارة فني',
                  onPressed: () {
                    context.pushReplacementNamed(
                      Routes.problemDescriptionScreen,
                      arguments: categoryId,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
