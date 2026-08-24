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
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/dilaog_utils.dart';
import 'package:salla7ly/features/profile/logic/profile_cubit.dart';
import 'package:salla7ly/features/profile/logic/profile_state.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_header.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_shimmer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        leading: Row(
          children: [
            Expanded(child: SizedBox(width: 20.w)),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.editprofilescrean);
              },
              child: SvgPicture.asset(Assets.svgsSettingIcon),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listenWhen: (previous, current) =>
                  current is Error && previous is! Error,

              listener: (context, state) {
                state.whenOrNull(
                  error: (apiErrorModel) {
                    DialogUtils.showMessage(
                      context: context,
                      type: DialogType.error,
                      title: 'خطأ',
                      message:
                          apiErrorModel.error?.message ?? 'حصل خطأ، حاول تاني',
                    );
                  },
                );
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
                    final points = user?.pointsBalance;
                    final fullName = user?.fullName;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileHeader(
                          name: fullName ?? "",
                          profileImage: user?.profileImage,
                        ),
                        verticalSpace(40),
                        Container(
                          width: double.infinity,
                          height: 64.h,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryColor.withValues(
                                  alpha: 1,
                                ),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Assets.svgsCashIcon),
                              horizontalSpace(8),
                              Text(
                                'محفظتي',
                                style: AppStyles.semiBold24Primary,
                              ),
                              horizontalSpace(8),
                              Text(
                                "$points",
                                style: AppStyles.semiBold24Primary,
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(40),
                        CustomElevatedButton(
                          text: 'قولنا مشكلتك',
                          onPressed: () {
                            context.pushReplacementNamed(
                              Routes.categoriesScreen,
                            );
                          },
                        ),
                        verticalSpace(8),
                        CustomElevatedButton(
                          text: 'اشحن',
                          onPressed: () {
                            context.pushNamed(Routes.chargingScreen);
                          },
                        ),
                        verticalSpace(8),
                        CustomElevatedButton(
                          text: 'طلباتك السابقه',
                          onPressed: () {
                            context.pushReplacementNamed(
                              Routes.mainnavigationscreen,
                              arguments: 2,
                            );
                          },
                        ),
                      ],
                    );
                  },
                  error: (error) {
                    return Text(error.error?.message ?? 'حصل خطأ');
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
