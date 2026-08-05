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
import 'package:salla7ly/core/widgets/custom_text_ftom_filed.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/select_location.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_requset_entity.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_response.dart';
import 'package:salla7ly/features/auth/signup/logic/location/location_cubit.dart';
import 'package:salla7ly/features/auth/signup/logic/sign_up/sign_up_cubit.dart';
import 'package:salla7ly/features/auth/signup/ui/screens/map_screen.dart';
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
  late double latitude;
  late double longitude;

  bool isChecked = false;

  Future<void> _pickLocation() async {
    final result = await context.pushNamed(Routes.mapScreen);

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
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: context.read<SignupCubit>().formKey,
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
                        controller: context.read<SignupCubit>().nameController,
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
                      GestureDetector(
                        onTap: () {
                          _pickLocation();
                        },
                        child: AbsorbPointer(
                          child: CustomTextFormField(
                            controller: context
                                .read<SignupCubit>()
                                .cityController,
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
                            controller: context
                                .read<SignupCubit>()
                                .locationController,
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
                      if (!isChecked) {
                        ToastMessage.toastMsg(
                          'من فضلك فعّل الموافقة على سياسة الخصوصية الأول',
                          AppColors.redColor,
                          AppColors.whiteColor,
                        );
                        return;
                      }

                      if (context
                              .read<SignupCubit>()
                              .formKey
                              .currentState!
                              .validate() &&
                          AppValidators.validateLocation(latitude, longitude)) {
                        context.read<SignupCubit>().signup(
                          SignupRequest(
                            fullName: context
                                .read<SignupCubit>()
                                .nameController
                                .text,
                            city: context
                                .read<SignupCubit>()
                                .cityController
                                .text,
                            address: context
                                .read<SignupCubit>()
                                .locationController
                                .text,
                            role: selectedType.name.toUpperCase(),
                            latitude: latitude,
                            longitude: longitude,
                            categoryId: selectedType == UserType.technician
                                ? selectedCategoryId
                                : null,
                            profileImage: context
                                .read<SignupCubit>()
                                .profileImage,
                            nationalId: context.read<SignupCubit>().nationalIdController.text,
                            criminalRecordFile: context
                                .read<SignupCubit>()
                                .criminalRecordFile,
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
                        context.pushNamed(Routes.homeScreen);
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
