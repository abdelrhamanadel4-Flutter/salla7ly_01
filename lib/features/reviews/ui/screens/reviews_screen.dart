import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/widgets/custom_app_bar.dart';
import 'package:salla7ly/features/home/widgets/rating.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_header.dart';
import 'package:salla7ly/features/reviews/ui/widgets/review_card.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            ProfileHeader(name: 'medo', isReviewScreen: true),
            RatingSection(),
            verticalSpace(10.h),
            ReviewCard(),
            verticalSpace(10.h),

            ReviewCard(),
          ],
        ),
      ),
    );
  }
}
