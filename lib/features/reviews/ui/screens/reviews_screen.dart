import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/widgets/custom_app_bar.dart';
import 'package:salla7ly/features/home/widgets/rating.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_header.dart';
import 'package:salla7ly/features/reviews/ui/widgets/review_card.dart';
import 'package:salla7ly/features/reviews/logic/technician_reviews_cubit.dart';
import 'package:salla7ly/features/reviews/logic/technician_reviews_state.dart';

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
            BlocBuilder<TechnicianReviewsCubit, TechnicianReviewsState>(
              builder: (context, state) => RatingSection(
                rating: state is TechnicianReviewsSuccess
                    ? state.page.averageRating ?? 0
                    : 0,
              ),
            ),
            verticalSpace(10.h),
            Expanded(
              child:
                  BlocBuilder<TechnicianReviewsCubit, TechnicianReviewsState>(
                    builder: (context, state) {
                      if (state is TechnicianReviewsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is TechnicianReviewsError) {
                        return Center(child: Text(state.message));
                      }
                      final reviews = state is TechnicianReviewsSuccess
                          ? state.page.reviews
                          : const [];
                      return ListView.separated(
                        itemCount: reviews.length,
                        separatorBuilder: (_, __) => verticalSpace(10.h),
                        itemBuilder: (_, index) => ReviewCard(
                          comment: reviews[index].comment,
                          rating: reviews[index].rating,
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
