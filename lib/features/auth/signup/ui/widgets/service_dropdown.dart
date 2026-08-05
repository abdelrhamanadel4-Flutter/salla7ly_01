import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/dilaog_utils.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/catgireos_response.dart';
import 'package:salla7ly/features/auth/signup/logic/categories/categories_cubit.dart';
import 'package:salla7ly/features/auth/signup/logic/categories/categories_state.dart';

class ServiceDropdown extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;

  const ServiceDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      
      listenWhen: (previous, current) => current is Error && previous is! Error,
      listener: (context, state) {
        state.whenOrNull(
          error: (apiErrorModel) {
            DialogUtils.showMessage(
              context: context,
              type: DialogType.error,
              title: 'خطأ',
              message: apiErrorModel.error?.message ?? 'حصل خطأ، حاول تاني',
            );
          },
        );
      },
      builder: (context, state) {
        final isLoading = state is Loading;

        final categories = state.maybeWhen(
          success: (data) => data.data ?? const <DataCatgireosResponse?>[],
          orElse: () => const <DataCatgireosResponse?>[],
        );

        return DropdownButtonFormField<String>(
          value: value,
          isExpanded: true,
          dropdownColor: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          hint: Text(
            isLoading ? 'جاري تحميل الخدمات...' : 'مجال الخدمة',
            style: AppStyles.semiBold14darkBlue,
          ),

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

          items: categories
              .where((category) => category != null)
              .map(
                (category) => DropdownMenuItem<String>(
                  value: category!.id.toString(),
                  child: Text(category.name ?? ''),
                ),
              )
              .toList(),


          onChanged: isLoading ? null : onChanged,
        );
      },
    );
  }
}
