import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/helpers/extesions.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';
import 'package:salla7ly/core/widgets/dilaog_utils.dart';
import 'package:salla7ly/core/widgets/custom_app_bar.dart';
import 'package:salla7ly/features/categories/domain/entity/categories_responce.dart';
import 'package:salla7ly/features/categories/logic/categories/categories_cubit.dart';
import 'package:salla7ly/features/categories/logic/categories/categories_state.dart';
import 'package:salla7ly/features/categories/ui/widgets/categories_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    final categoriesCubit = context.read<CategoriesCubit>();
    if (categoriesCubit.state is Initial) {
      categoriesCubit.getCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.imagesLogo),
                verticalSpace(8),
                Text('اختار مجال المشكلة', style: AppStyles.bold24Primary),
                verticalSpace(24),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withValues(alpha: 1),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: BlocConsumer<CategoriesCubit, CategoriesState>(
                      listenWhen: (previous, current) =>
                          current is Error && previous is! Error,

                      listener: (context, state) {
                        state.whenOrNull(
                          error: (apiErrorModel) {
                            DialogUtils.showMessage(
                              context: context,
                              type: DialogType.error,
                              title: 'خطأ',
                              message:
                                  apiErrorModel.error?.message ??
                                  'حصل خطأ، حاول تاني',
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        if (state is Loading) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        final categories = state.maybeWhen(
                          success: (data) =>
                              data.data ?? const <DataCategoriesResponse?>[],
                          orElse: () => const <DataCategoriesResponse?>[],
                        );

                        if (state is! Loading && categories.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Text(
                              'لا توجد اقسام متاحة حالياً',
                              style: AppStyles.mediun16LightGrey,
                            ),
                          );
                        }
                        return GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 1.6,
                          children: categories
                              .where((category) => category?.id != null)
                              .map(
                                (category) => CategoriesItem(
                                  categoryName: category!.name ?? '',
                                  onTap: () {
                                    context.pushNamed(
                                      Routes.kindOfProblemScreen,
                                      arguments: category.id!,
                                    );
                                  },
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
