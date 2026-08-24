import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/networking/api_constants.dart';
import 'package:salla7ly/core/widgets/notification_bell.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    this.name = '',
    this.isEditPROFILE = false,
    this.isReviewScreen = false,
    this.profileImage,
    this.localProfileImage,
    this.onEditImage,
  });

  final String name;
  final bool isEditPROFILE;
  final bool isReviewScreen;
  final String? profileImage;
  final File? localProfileImage;
  final VoidCallback? onEditImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 145.w,
              height: 145.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(color: AppColors.primaryColor, width: 1.5.w),
              ),
              child: ClipOval(child: _buildProfileImage()),
            ),

            Visibility(
              visible: isEditPROFILE,
              child: Positioned(
                bottom: -1,

                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1.5.w,
                    ),
                  ),
                  child: ClipOval(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 1.h,
                      ),
                      child: GestureDetector(
                        onTap: onEditImage,
                        child: SvgPicture.asset(Assets.svgsEditImage),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        verticalSpace(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isEditPROFILE || isReviewScreen
                ? SizedBox()
                : const NotificationBell(),
            horizontalSpace(4),
            Text(name, style: AppStyles.bold24Primary),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    if (localProfileImage != null) {
      return Image.file(localProfileImage!, fit: BoxFit.cover);
    }

    final imageUrl = profileImage == null || profileImage!.isEmpty
        ? null
        : profileImage!.startsWith('http')
        ? profileImage!
        : '${ApiConstants.baseUrl}${profileImage!.replaceFirst(RegExp(r'^/'), '')}';

    if (imageUrl == null) {
      return Image.asset(Assets.imagesProfileImage, fit: BoxFit.cover);
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      ),
      errorWidget: (context, url, error) =>
          Image.asset(Assets.imagesProfileImage, fit: BoxFit.cover),
    );
  }
}
