import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_state.dart';
import 'package:salla7ly/features/problem_description/logic/request_offers/request_offers_cubit.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/technician_request_container.dart';

class RequestTechnicianScreen extends StatelessWidget {
  const RequestTechnicianScreen({super.key, required this.requestId});

  final String requestId;

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
                Center(
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: 244.w,
                    height: 140.h,
                  ),
                ),
                verticalSpace(8),
                Text('طلب فني خبير', style: AppStyles.bold20Primary),
                verticalSpace(16),
                Container(
                  width: double.infinity,
                  height: 140.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                    border: BoxBorder.all(color: AppColors.primaryColor),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 1),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset(Assets.imagesHeaterImage),
                ),
                verticalSpace(16),
                BlocBuilder<RequestOffersCubit, PublishState<List<CustomerOffer>>>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      success: (offers) {
                        if (offers.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 32.h),
                              child: Text(
                                'لسه مفيش عروض من الفنيين',
                                style: AppStyles.semiBold14darkBlue,
                              ),
                            ),
                          );
                        }

                        return Column(
                          children: offers
                              .map(
                                (offer) => Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: TechnicianRequestContainer(
                                    offer: offer,
                                    onTap: () {
                                      context.pushReplacementNamed(
                                        Routes.techProfileCustomerViewScreen,
                                        arguments: offer,
                                      );
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      },
                      error: (error) => Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 32.h),
                          child: Text(
                            error.error?.message ?? 'حصل خطأ، حاول تاني',
                            style: AppStyles.semiBold14darkBlue,
                          ),
                        ),
                      ),
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
