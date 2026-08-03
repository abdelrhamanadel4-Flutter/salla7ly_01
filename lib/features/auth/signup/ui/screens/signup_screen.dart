import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/helpers/validatores.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_ftom_filed.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                verticalSpace(16),
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
                CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      // TODO: no signup API/data layer exists in this codebase yet
                      // (only the login/request-otp/verify-otp feature is implemented).
                      // Once a signup endpoint + repo/use case are added, call it here
                      // with _nameController.text and route to otpScreen on success,
                      // the same way login_screen.dart does.
                      Navigator.pushNamed(context, Routes.loginScreen);
                    }
                  },
                  text: 'تمام',
                  backgroundColor: AppColors.primaryColor,
                  textStyle: AppStyles.bold16LightGrey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
