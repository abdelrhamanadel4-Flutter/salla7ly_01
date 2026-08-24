import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/features/home/widgets/rating.dart';
import 'package:salla7ly/features/profile/logic/profile_cubit.dart';
import 'package:salla7ly/features/profile/logic/profile_state.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_header.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onCommissionsTap;

  const HomeScreen({super.key, this.onCommissionsTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: GestureDetector(
            onTap: () {
              context.pushNamed(Routes.editprofilescreantech);
            },
            child: SvgPicture.asset(Assets.svgsSettingIcon),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 20.h),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listenWhen: (previous, current) =>
                  current is Error && previous is! Error,
              listener: (context, state) {
                // خلي الـ listener بتاعك الحالي هنا زي ما هو
              },
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return const SizedBox.shrink();
                  },

                  loading: () {
                    return const ProfileShimmer();
                  },

                  success: (profileResponse) {
                    final user = profileResponse.data?.user;

                    final fullName = user?.fullName ?? 'اسم الفني';
                    final points = user?.pointsBalance ?? 0;

                    return Column(
                      children: [
                        ProfileHeader(name: fullName),

                        verticalSpace(24),

                        const RatingSection(),

                        verticalSpace(18),

                        _WalletCard(points: points),

                        verticalSpace(10),

                        GestureDetector(
                          onTap: onCommissionsTap,
                          child: const _PreviousCommissionsButton(),
                        ),

                        verticalSpace(14),

                        ProfileActionButton(
                          title: 'عرض الطلبات',
                          onPressed: () {
                            context.pushNamed(Routes.requsetsscreen);
                          },
                        ),

                        verticalSpace(10),

                        ProfileActionButton(
                          title: 'تقييماتك',
                          onPressed: () {
                            context.pushNamed(Routes.reviewsscreen);
                          },
                        ),
                      ],
                    );
                  },

                  error: (error) {
                    return Center(
                      child: Text(
                        error.error?.message ?? 'حصل خطأ',
                        style: AppStyles.bold16Primary,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _WalletCard extends StatelessWidget {
  final dynamic points;

  const _WalletCard({required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(9.r),
        border: Border.all(color: AppColors.primaryColor, width: 1.2.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.9),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SvgPicture.asset(
            Assets.svgsComssions,
            color: AppColors.primaryColor,
            width: 30.w,
          ),
          horizontalSpace(7),
          Text('محفظتي', style: AppStyles.semiBold24Primary),
          horizontalSpace(14),

          Text('$points', style: AppStyles.semiBold24Primary),
        ],
      ),
    );
  }
}

class _PreviousCommissionsButton extends StatelessWidget {
  const _PreviousCommissionsButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(9.r),
        border: Border.all(color: AppColors.orangeColor, width: 1.5.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.orangeColor.withValues(alpha: 1),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.svgsComssions,
            color: AppColors.orangeColor,
            width: 30.w,
          ),
          horizontalSpace(8),

          Text(
            'عمولاتك السابقة',
            style: AppStyles.semiBold24Primary.copyWith(
              color: AppColors.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  ProfileActionButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.r),
          ),
        ),
        child: Text(
          title,
          style: AppStyles.bold16Primary.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
