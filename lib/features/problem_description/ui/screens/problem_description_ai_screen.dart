import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_form_filed.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_request.dart';
import 'package:salla7ly/features/problem_description/logic/problem_description/problem_description_ai_bloc_listener.dart';
import 'package:salla7ly/features/problem_description/logic/problem_description/problem_description_cubit.dart';
import 'package:salla7ly/features/problem_description/ui/widgets/problem_image_picker.dart';

class ProblemDescriptionAiScreen extends StatelessWidget {
  ProblemDescriptionAiScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProblemDescriptionCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.imagesLogo),
                verticalSpace(8),
                Text('اوصف مشكلتك ل Ai', style: AppStyles.bold24Primary),
                verticalSpace(24),
                CustomTextFormField(
                  controller: cubit.titleController,
                  hintStyle: AppStyles.semiBold14darkBlue,
                  hintText: 'عنوان مشكلتك',
                ),
                verticalSpace(8),
                CustomTextFormField(
                  controller: cubit.descriptionController,
                  hintStyle: AppStyles.semiBold14darkBlue,
                  hintText: 'قول مشكلتك',
                ),
                verticalSpace(8),
                ProblemImagePicker(),
                verticalSpace(16),
                CustomElevatedButton(
                  text: 'تمام',
                  onPressed: () {
                    final request = ProblemDescriptionRequest(
                      title: cubit.titleController.text.trim(),
                      description: cubit.descriptionController.text.trim(),
                      requestType: 'AI_ESTIMATION',
                      categoryId: categoryId,
                      images: ["/uploads/1712-sink.jpg"],
                      serviceAddress: 'agami',
                      serviceCity: 'alex',
                    );
                    cubit.createProblemDescription(request);
                  },
                ),
                verticalSpace(8),
                CustomElevatedButton(
                  text: 'خرجني',
                  onPressed: () {
                    context.pushReplacementNamed(Routes.mainnavigationscreen);
                  },
                ),
                ProblemDescriptionAiBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
