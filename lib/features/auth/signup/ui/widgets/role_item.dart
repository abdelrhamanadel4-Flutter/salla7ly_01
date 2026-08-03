import 'package:flutter/material.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class RoleItem extends StatelessWidget {
  RoleItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  String title;
  bool isSelected;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
        ),
        child: Text(
          title,
          style: AppStyles.medium16Primary.copyWith(
            color: isSelected ? Colors.white : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
