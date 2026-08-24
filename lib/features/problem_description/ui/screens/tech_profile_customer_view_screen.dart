import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';
import 'package:salla7ly/features/problem_description/logic/accept_offer/accept_offer_bloc_listener.dart';
import 'package:salla7ly/features/problem_description/logic/accept_offer/accept_offer_cubit.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/customer_evalution.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/tech_details.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/tech_profile_header.dart';
import 'package:salla7ly/features/reviews/domain/entities/technician_review.dart';
import 'package:salla7ly/features/reviews/logic/technician_reviews_cubit.dart';

class TechProfileCustomerViewScreen extends StatelessWidget {
  const TechProfileCustomerViewScreen({super.key, required this.offer});

  final CustomerOffer offer;

  @override
  Widget build(BuildContext context) {
    final technician = offer.technician;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TechProfileHeader(technician: technician),
                verticalSpace(40),
                BlocBuilder<TechnicianReviewsCubit, TechnicianReviewsState>(
                  builder: (context, state) {
                    final averageRating = state is TechnicianReviewsSuccess
                        ? double.tryParse(state.data.averageRating ?? '')
                        : null;

                    return TechDetails(
                      technician: technician,
                      rating: averageRating,
                    );
                  },
                ),
                verticalSpace(24),
                BlocBuilder<TechnicianReviewsCubit, TechnicianReviewsState>(
                  builder: (context, state) {
                    if (state is TechnicianReviewsLoading) {
                      return const CircularProgressIndicator();
                    }

                    if (state is TechnicianReviewsError) {
                      return Text(state.message);
                    }

                    if (state is! TechnicianReviewsSuccess ||
                        state.data.reviews.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return Column(
                      children: state.data.reviews
                          .map(
                            (review) => Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: CustomerEvalution(
                                evalutionMessage: _reviewMessage(review),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                verticalSpace(24),
                CustomElevatedButton(
                  text: 'موافق',
                  onPressed: () {
                    final requestId = offer.requestId;
                    final offerId = offer.offerId;
                    if (requestId == null || offerId == null) return;

                    context.read<AcceptOfferCubit>().acceptOffer(
                          requestId,
                          offerId,
                        );
                  },
                ),
                const AcceptOfferBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _reviewMessage(TechnicianReview review) {
    final name = review.customerName ?? 'عميل';
    final comment = review.comment;

    return comment == null || comment.isEmpty ? name : '$name: $comment';
  }
}
