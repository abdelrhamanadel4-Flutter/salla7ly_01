import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/custom_elveted_buttom.dart';
import 'package:salla7ly/core/widgets/custom_text_form_filed.dart';

class AddChargingPriceScreen extends StatelessWidget {
  const AddChargingPriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? chargingController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(Assets.svgsSettingIcon),
                    GestureDetector(
                      onTap: context.pop,
                      child: SvgPicture.asset(Assets.svgsArrowBack),
                    ),
                  ],
                ),
                Image.asset(Assets.imagesLogo),
                verticalSpace(8),
                Text('عروض الشحن', style: AppStyles.bold24Primary),
                verticalSpace(16),
                CustomTextFormField(
                  controller: chargingController,
                  hintStyle: AppStyles.semiBold14darkBlue,
                  hintText: 'دخل رقم تاني',
                ),
                verticalSpace(16),
                CustomElevatedButton(
                  onPressed: () {},
                  text: 'اشحن',
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
