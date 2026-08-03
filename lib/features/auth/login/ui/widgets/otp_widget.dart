import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/features/auth/login/logic/login_cubit.dart';

class OtpWidget extends StatelessWidget {
  OtpWidget({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialPinField(
        length: 6,
        pinController: context.read<LoginCubit>().otpcontroller,

        separatorBuilder: (context, index) {
          return SizedBox(width: 12);
        },

        theme: MaterialPinTheme(
          shape: MaterialPinShape.outlined,

          cellSize: const Size(44, 56),

          fillColor: Colors.white,

          focusedBorderColor: AppColors.primaryColor,

          errorBorderColor: Colors.red,

          borderRadius: BorderRadius.circular(12),

          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),

        
      ),
    );
  }
}
