import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/helpers/validatores.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_text_ftom_filed.dart';
import 'package:salla7ly/features/auth/signup/logic/categories/categories_cubit.dart';
import 'package:salla7ly/features/auth/signup/logic/categories/categories_state.dart' as categories;
import 'package:salla7ly/features/auth/signup/logic/sign_up/sign_up_cubit.dart';
import 'package:salla7ly/features/auth/signup/logic/sign_up/sign_up_state.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/criminal_record_field.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/service_dropdown.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/upload_image_field.dart';

class TechnicianFields extends StatefulWidget {
  const TechnicianFields({
    super.key,
    required this.selectedCategoryId,
    required this.onCategoryChanged,
  });

  final String? selectedCategoryId;
  final ValueChanged<String?> onCategoryChanged;

  @override
  State<TechnicianFields> createState() => _TechnicianFieldsState();
}

class _TechnicianFieldsState extends State<TechnicianFields> {
  @override
  void initState() {
    super.initState();
    final categoriesCubit = context.read<CategoriesCubit>();
    if (categoriesCubit.state is categories.Initial) {
      categoriesCubit.getCategories();
    }
  }
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return BlocBuilder<SignupCubit, SignUpState>(
      builder: (context, state) {
        return Column(
          children: [
            ServiceDropdown(
              value: widget.selectedCategoryId,
              onChanged: widget.onCategoryChanged,
            ),

            verticalSpace(16),

            CustomTextFormField(
              controller: context.read<SignupCubit>().nationalIdController,
              validator: (value) {
                return AppValidators.validateNationalId(value);
              },
              hintStyle: AppStyles.semiBold14darkBlue,
              hintText: 'دخل الرقم القومي',
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SvgPicture.asset(Assets.svgsNationalIdIcon),
              ),
            ),

            verticalSpace(16),

            UploadImageField(
              imageFile: cubit.profileImage,
              onTap: () {
                cubit.pickProfileImage();
              },
            ),

            verticalSpace(16),

            CriminalRecordField(
              file: cubit.criminalRecordFile,
              onTap: () {
                cubit.pickCriminalRecord();
              },
            ),
          ],
        );
      },
    );
  }
}
