import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/flutter_toast.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/helpers/validatores.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_form_filed.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_requset_entity.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_response.dart';
import 'package:salla7ly/features/auth/signup/logic/sign_up/sign_up_cubit.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/privacy_policy_checkbox.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/role_selector.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/sign_up_bloc_listener.dart';
import 'package:salla7ly/features/auth/signup/ui/widgets/technician_fields.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  UserType selectedType = UserType.customer;
  String? selectedCategoryId;
  double? latitude;
  double? longitude;

  bool isChecked = false;

  Future<void> _pickLocation() async {
    final result = await context.pushNamed(Routes.mapScreen);
    if (!mounted) return;
    if (result != null) {
      setState(() {
        context.read<SignupCubit>().cityController.text = result.city;
        context.read<SignupCubit>().locationController.text = result.address;

        latitude = result.latitude;
        longitude = result.longitude;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(Assets.imagesLogo),
                  verticalSpace(8),
                  Text('إعمل حساب جديد', style: AppStyles.bold24Primary),
                  verticalSpace(8),
                  Column(
                    children: [
                      CustomTextFormField(
                        controller: cubit.nameController,
                        validator: (value) {
                          return AppValidators.validateUsername(
                            cubit.nameController.text,
                          );
                        },
                        hintStyle: AppStyles.semiBold14darkBlue,
                        hintText: 'دخل اسمك',
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: SvgPicture.asset(Assets.svgsNameIcon),
                        ),
                      ),
                      verticalSpace(16),
                      GestureDetector(
                        onTap: () {
                          _pickLocation();
                        },
                        child: AbsorbPointer(
                          child: CustomTextFormField(
                            controller: cubit.cityController,
                            hintStyle: AppStyles.semiBold14darkBlue,
                            validator: (value) {
                              return AppValidators.validateCity(value);
                            },
                            readonly: true,
                            hintText: 'مدينتك',
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: SvgPicture.asset(Assets.svgsCityIcon),
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(16),
                      GestureDetector(
                        onTap: () {
                          _pickLocation();
                        },
                        child: AbsorbPointer(
                          child: CustomTextFormField(
                            controller: cubit.locationController,
                            hintStyle: AppStyles.semiBold14darkBlue,
                            validator: (value) {
                              return AppValidators.validateAddress(value);
                            },
                            hintText: 'مكانك',
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: SvgPicture.asset(Assets.svgsLocationIcon),
                            ),
                          ),
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
                        TechnicianFields(
                          selectedCategoryId: selectedCategoryId,
                          onCategoryChanged: (value) {
                            setState(() {
                              selectedCategoryId = value;
                            });
                          },
                        ),
                    ],
                  ),
                  verticalSpace(16),
                  CustomElevatedButton(
                    onPressed: () {
                      if (selectedType == UserType.technician &&
                          (cubit.criminalRecordFile == null ||
                              cubit.profileImage == null)) {
                        ToastMessage.toastMsg(
                          'من فضلك قم بإختيار صورة شخصية و الفيش والتشبيه',
                          AppColors.redColor,
                          AppColors.whiteColor,
                        );
                        return;
                      }
                      if (!isChecked) {
                        ToastMessage.toastMsg(
                          'من فضلك فعّل الموافقة على سياسة الخصوصية الأول',
                          AppColors.redColor,
                          AppColors.whiteColor,
                        );
                        return;
                      }
                      if (cubit.formKey.currentState!.validate() &&
                          AppValidators.validateLocation(latitude, longitude)) {
                        cubit.signup(
                          SignupRequest(
                            fullName: cubit.nameController.text,
                            city: cubit.cityController.text,
                            address: cubit.locationController.text,
                            role: selectedType.name.toUpperCase(),
                            latitude: latitude,
                            longitude: longitude,
                            categoryId: selectedType == UserType.technician
                                ? selectedCategoryId
                                : null,
                            profileImage: cubit.profileImage,
                            nationalId: cubit.nationalIdController.text,
                            criminalRecordFile: cubit.criminalRecordFile,
                          ),
                        );
                      }
                    },
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

                  SignUpBlocListener(
                    onSuccess: (data) {
                      if (selectedType == UserType.customer) {
                        context.pushAndRemoveUntil(Routes.mainnavigationscreen);
                      } else {
                        final response = data as SignUpResponse?;
                        Navigator.pushNamed(
                          context,
                          Routes.technicianAcceptanceScreen,
                          arguments: response?.data?.message,
                        );
                      }
                    },
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
