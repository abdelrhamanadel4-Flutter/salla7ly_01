import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/widgets/custom_app_bar.dart';
import 'package:salla7ly/features/customer_account_in_tech_view/widgets/consultation_price_dialog.dart';
import 'package:salla7ly/features/customer_account_in_tech_view/widgets/contact_customer_dialog.dart';
import 'package:salla7ly/features/home/home_screen.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_header.dart';
import 'package:salla7ly/features/requsets/domain/entity/technician_job.dart';
import 'package:salla7ly/features/requsets/logic/submit_job_offer_cubit.dart';

class CustomerAccount extends StatelessWidget {
  final TechnicianJob job;

  const CustomerAccount({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final customer = job.request?.customer;
    final baseUrl = 'https://back.markwasfy00.xyz';
    final images = job.request?.images ?? [];

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            ProfileHeader(
              isReviewScreen: true,
              name: customer?.fullName ?? '',
            ),
            verticalSpace(10.h),

            // Location row
            Container(
              width: double.infinity,
              height: 51.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.primaryColor, width: 1.w),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: AppColors.primaryColor),
                    Text(
                      '${customer?.city ?? ''} · ${customer?.distanceKm ?? ''} كم',
                      style: AppStyles.mediun12Primary,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(15),

            // Image
            if (images.isNotEmpty)
              Container(
                width: double.infinity,
                height: 140.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primaryColor),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withValues(alpha: 1),
                      blurRadius: 4,
                      spreadRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '$baseUrl${images.first}',
                    fit: BoxFit.cover,
                    errorBuilder: (_, e, __) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
              ),

            verticalSpace(8),

            // Description
            Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 51.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.primaryColor, width: 1.w),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Text(
                  job.request?.description ?? '',
                  style: AppStyles.regular14darkBlue,
                ),
              ),
            ),

            verticalSpace(20.h),

            BlocListener<SubmitJobOfferCubit, SubmitJobOfferState>(
              listener: (context, state) {
                if (state is SubmitJobOfferSuccess) {
                  ContactCustomerDialog.show(
                    context,
                    phoneNumber: '—',
                  );
                } else if (state is SubmitJobOfferError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              child: ProfileActionButton(
                title: 'موافق ',
                onPressed: () {
                  ConsultationPriceDialog.show(
                    context,
                    minFee: job.minFee,
                    maxFee: job.maxFee,
                    suggestedFee: job.suggestedFee,
                    onSubmit: (price) {
                      context.read<SubmitJobOfferCubit>().submitOffer(
                            job.id ?? '',
                            price,
                          );
                    },
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
