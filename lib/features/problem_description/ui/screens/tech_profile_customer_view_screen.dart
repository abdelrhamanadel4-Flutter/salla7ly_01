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
                TechDetails(technician: technician),
                verticalSpace(24),
                CustomerEvalution(evalutionMessage: 'ممتاز'),
                verticalSpace(16),
                CustomerEvalution(evalutionMessage: 'جيد جدا'),
                verticalSpace(16),
                CustomerEvalution(evalutionMessage: 'مش وحش'),
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
}
