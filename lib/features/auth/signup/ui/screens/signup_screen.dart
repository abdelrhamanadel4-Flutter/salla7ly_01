import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/helpers/validatores.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_ftom_filed.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/privacy_policy_checkbox.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/role_selector.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/technician_fields.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _locationController = TextEditingController();
  UserType selectedType = UserType.customer;
  bool isChecked = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(Assets.imagesLogo),
                  verticalSpace(8),
                  Text('إعمل حساب جديد', style: AppStyles.bold24Primary),
                  verticalSpace(8),
                  Form(
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _nameController,
                          validator: (value) {
                            return AppValidators.validateFullName(value);
                          },
                          hintStyle: AppStyles.semiBold14darkBlue,
                          hintText: 'دخل اسمك',
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: SvgPicture.asset(Assets.svgsNameIcon),
                          ),
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          controller: _cityController,
                          hintStyle: AppStyles.semiBold14darkBlue,
                          hintText: 'مدينتك',
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: SvgPicture.asset(Assets.svgsCityIcon),
                          ),
                        ),
                        verticalSpace(16),
                        CustomTextFormField(
                          controller: _locationController,
                          hintStyle: AppStyles.semiBold14darkBlue,
                          hintText: 'مكانك',
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: SvgPicture.asset(Assets.svgsLocationIcon),
                          ),
                        ),
                        verticalSpace(16),
                        RoleSelector(
                          selectedType: selectedType,
                          onChanged: (type) {
                            setState(() {
                              selectedType = type;
                            });
                          },
                        ),
                        verticalSpace(16),
                        if (selectedType == UserType.technician)
                          const TechnicianFields(),
                      ],
                    ),
                  ),
                  verticalSpace(16),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: 'تمام',
                    backgroundColor: AppColors.primaryColor,
                    textStyle: AppStyles.bold16LightGrey,
                  ),
                  verticalSpace(16),
                  Align(
                    alignment: Alignment.center,
                    child: PrivacyPolicyCheckbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
