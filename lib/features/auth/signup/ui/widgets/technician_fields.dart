import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/helpers/validatores.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_text_ftom_filed.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/criminal_record_field.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/service_dropdown.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/upload_image_field.dart';

class TechnicianFields extends StatelessWidget {
  const TechnicianFields({super.key});

  @override
  Widget build(BuildContext context) {
    final _nationalIdController = TextEditingController();
    String? selectedService;
    return Column(
      children: [
        ServiceDropdown(
          value: selectedService,
          items: const ['سباكة', 'كهرباء', 'نجارة'],
          onChanged: (value) {},
        ),

        verticalSpace(16),

        CustomTextFormField(
          controller: _nationalIdController,
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

        UploadImageField(onTap: () {}),

        verticalSpace(16),

        CriminalRecordField(onTap: () {}),
      ],
    );
  }
}
