import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

import 'package:salla7ly/features/auth/signup/ui/widgets/role_item.dart';

enum UserType { customer, technician }

class RoleSelector extends StatelessWidget {
  UserType selectedType;
  final Function(UserType) onChanged;

  RoleSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.svgsRoleIcon),
            horizontalSpace(8),
            Text('دورك', style: AppStyles.semiBold14darkBlue),
          ],
        ),
        verticalSpace(8),
        Row(
          children: [
            Expanded(
              child: RoleItem(
                title: 'عميل',
                isSelected: selectedType == UserType.customer,
                onTap: () {
                  onChanged(UserType.customer);
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: RoleItem(
                title: 'فني',
                isSelected: selectedType == UserType.technician,
                onTap: () {
                  onChanged(UserType.technician);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
