import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/flutter_toast.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/features/problem_description/logic/problem_description/problem_description_cubit.dart';
import 'package:salla7ly/features/problem_description/logic/problem_description/problem_description_state.dart';

class ProblemImagePicker extends StatelessWidget {
  const ProblemImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProblemDescriptionCubit,
        ProblemDescriptionState>(
      buildWhen: (previous, current) => current is Initial,
      builder: (context, state) {
        final cubit = context.read<ProblemDescriptionCubit>();

        return InkWell(
          onTap: () async {
            final error = await cubit.pickProblemImage();
            if (!context.mounted || error == null) return;
            ToastMessage.toastMsg(
              error,
              AppColors.redColor,
              AppColors.whiteColor,
            );
          },
          child: Container(
            width: double.infinity,
            height: 140.h,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: AppColors.darkBlueColor,
              ),
            ),
            child: cubit.problemImage == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.svgsCameraIcon,
                      ),
                      verticalSpace(4),
                      Text(
                        'حط صورة \n للمشكلة',
                        textAlign: TextAlign.center,
                        style: AppStyles.semiBold14darkBlue,
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.file(
                      cubit.problemImage!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
