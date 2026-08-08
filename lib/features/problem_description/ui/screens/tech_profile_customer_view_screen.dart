import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/customer_evalution.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/tech_details.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/tech_profile_header.dart';

class TechProfileCustomerViewScreen extends StatelessWidget {
  const TechProfileCustomerViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TechProfileHeader(),
                verticalSpace(40),
                TechDetails(),
                verticalSpace(24),
                CustomerEvalution(evalutionMessage: 'ممتاز'),
                verticalSpace(16),
                CustomerEvalution(evalutionMessage: 'جيد جدا'),
                verticalSpace(16),
                CustomerEvalution(evalutionMessage: 'مش وحش'),
                verticalSpace(24),
                CustomElevatedButton(text: 'موافق', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
