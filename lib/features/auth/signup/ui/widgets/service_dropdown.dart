import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class ServiceDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const ServiceDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      dropdownColor: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(12),
      hint: Text('مجال الخدمة', style: AppStyles.semiBold14darkBlue),

      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,

        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SvgPicture.asset(
            Assets.svgsServiceFieldIcon,
            width: 24.w,
            height: 24.h,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),

      items: items.map((service) {
        return DropdownMenuItem(
          value: service,
          child: Text(service, style: AppStyles.semiBold14darkBlue),
        );
      }).toList(),

      onChanged: onChanged,
    );
  }
}
