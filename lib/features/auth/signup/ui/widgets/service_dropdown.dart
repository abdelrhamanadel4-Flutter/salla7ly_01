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
import 'package:salla7ly/features/auth/signup/logic/sign_up/sign_up_cubit.dart';

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
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return DropdownButtonFormField<DataCatgireosResponse>(
              items: const [],
              onTap: () {
                context.read<CategoriesCubit>().getCategories();
              },
              onChanged: (_) {},
            );
          },

          loading: () {
            return const Center(child: CircularProgressIndicator());
          },

          success: (data) {
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

              items: data.data!.map((category) {
                return DropdownMenuItem<String>(
                  value: category!.id.toString(),
                  child: Text(category.name!),
                );
              }).toList(),

              onChanged: onChanged,
            );
          },

          error: (apiErrorModel) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              DialogUtils.showMessage(
                context: context,
                type: DialogType.error,
                title: "خطأ",
                message: apiErrorModel.error?.message ?? "حصل خطأ، حاول تاني",
                posAction: () {
                  Navigator.of(context).pop();
                },
              );
            });

            return const SizedBox();
          },
        );
      },
    );
  }
}
