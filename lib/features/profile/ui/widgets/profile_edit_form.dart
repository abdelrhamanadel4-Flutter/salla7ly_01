import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/shared_pref_helper.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_form_filed.dart';
import 'package:salla7ly/features/profile/domain/entity/profile_response.dart';
import 'package:salla7ly/features/profile/domain/entity/update_profile_request.dart';
import 'package:salla7ly/features/profile/logic/profile_cubit.dart';
import 'package:salla7ly/features/profile/ui/widgets/profile_header.dart';

class ProfileEditForm extends StatefulWidget {
  final ProfileResponse profile;
  final bool isTechnician;

  const ProfileEditForm({
    super.key,
    required this.profile,
    this.isTechnician = false,
  });

  @override
  State<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  late final TextEditingController _fullNameController;
  File? _profileImage;

  UserProfileResponse? get _user => widget.profile.data?.user;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: _user?.fullName ?? '');
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  Future<void> _pickProfileImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null || !mounted) return;

    setState(() => _profileImage = File(image.path));
  }

  void _save() {
    final fullName = _fullNameController.text.trim();
    final hasNameChange = fullName.isNotEmpty && fullName != _user?.fullName;

    if (!hasNameChange && _profileImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك عدّل الاسم أو الصورة أولاً')),
      );
      return;
    }

    context.read<ProfileCubit>().updateProfile(
      UpdateProfileRequest(
        fullName: hasNameChange ? fullName : null,
        profileImage: _profileImage,
      ),
    );
  }

  Future<void> _logout() async {
    await SharedPrefHelper.logout();
    if (!mounted) return;
    context.pushAndRemoveUntil(Routes.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    final profileImage =
        widget.profile.data?.technician?.profileImage ?? _user?.profileImage;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileHeader(
            isEditPROFILE: true,
            profileImage: profileImage,
            localProfileImage: _profileImage,
            onEditImage: _pickProfileImage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('تعديلات', style: AppStyles.Bold24darkerBlue)],
          ),
          verticalSpace(5.h),
          CustomTextFormField(controller: _fullNameController),
          verticalSpace(10.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text('لو عايز تغير رقمك', style: AppStyles.regular14Grey),
          ),
          verticalSpace(5.h),
          CustomTextFormField(
            readonly: true,
            hintText: _user?.phone ?? '',
            hintStyle: AppStyles.semiBold14primary,
          ),
          verticalSpace(10.h),
          CustomTextFormField(
            readonly: true,
            hintText: 'أدخل الرقم الجديد',
            hintStyle: AppStyles.semiBold14primary,
          ),
          verticalSpace(10.h),
          CustomElevatedButton(text: 'تأكيد', onPressed: _save),
          if (widget.isTechnician) ...[
            verticalSpace(10.h),
            Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.orangeColor, width: 1.7),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('للشكاوي', style: AppStyles.bold16Primary),
                  verticalSpace(2.h),
                  Text('0123456789', style: AppStyles.bold16Primary),
                ],
              ),
            ),
          ],
          verticalSpace(10.h),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  text: 'تسجيل خروج',
                  onPressed: _logout,
                ),
              ),
              horizontalSpace(10.w),
              Expanded(
                child: CustomElevatedButton(
                  text: 'امسح حسابك',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
