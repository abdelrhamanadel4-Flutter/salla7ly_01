import 'package:flutter/material.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class PrivacyPolicyCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const PrivacyPolicyCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          activeColor: AppColors.primaryColor,
        ),
        horizontalSpace(8),
        Text('انا اوافق على سياسة الخصوصية', style: AppStyles.regular14Grey),
      ],
    );
  }
}
