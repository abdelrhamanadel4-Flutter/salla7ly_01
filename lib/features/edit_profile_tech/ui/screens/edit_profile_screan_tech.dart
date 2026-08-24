import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_form_filed.dart';
import 'package:salla7ly/core/widgets/dilaog_utils.dart';
import 'package:salla7ly/features/profile/logic/profile_cubit.dart';
import 'package:salla7ly/features/profile/logic/profile_state.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_header.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_shimmer.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_edit_form.dart';

class EditProfileScreanTech extends StatelessWidget {
  const EditProfileScreanTech({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: SizedBox(),
        actions: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: SvgPicture.asset(Assets.svgsArrowBack),
          ),
          SizedBox(width: 20.w),
        ],
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
                    final fullName = user?.fullName;

                    return ProfileEditForm(
                      profile: profileResponse,
                      isTechnician: true,
                    );

                    // ignore: dead_code
                    return Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfileHeader(isEditPROFILE: true),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'تعديلات',
                                style: AppStyles.Bold24darkerBlue,
                              ),
                            ],
                          ),
                          verticalSpace(5.h),

                          CustomTextFormField(hintText: fullName),
                          verticalSpace(10.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'لو عايز تغير رقمك',
                              style: AppStyles.regular14Grey,
                            ),
                          ),
                          verticalSpace(5.h),

                          CustomTextFormField(
                            hintText: 'الرقم التم بيه التسجيل',
                            hintStyle: AppStyles.semiBold14primary,
                          ),
                          verticalSpace(10.h),

                          CustomTextFormField(
                            hintText: 'دخل الرقم الجديد',
                            hintStyle: AppStyles.semiBold14primary,
                          ),
                          verticalSpace(10.h),
                          CustomElevatedButton(text: 'تأكيد', onPressed: () {}),
                          verticalSpace(10.h),
                          Container(
                            width: double.infinity,
                            height: 60.h,

                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(8.r),
                              border: BoxBorder.all(
                                color: AppColors.orangeColor,
                                width: 1.7,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('للشكاوي', style: AppStyles.bold16Primary),
                                verticalSpace(2.h),
                                Text(
                                  '0123456789',
                                  style: AppStyles.bold16Primary,
                                ),
                              ],
                            ),
                          ),
                          verticalSpace(10.h),
                          SizedBox(
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: 'تسجيل خروج ',
                                    onPressed: () {},
                                  ),
                                ),
                                horizontalSpace(10.w),
                                Expanded(
                                  child: CustomElevatedButton(
                                    text: 'امسح حسابك ',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
