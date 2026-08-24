import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/core/theming/assets.dart';

class ConsultationPriceDialog extends StatefulWidget {
  const ConsultationPriceDialog({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  static Future<void> show(BuildContext context, {VoidCallback? onCompleted}) {
    return showDialog<void>(
      context: context,
      builder: (_) => ConsultationPriceDialog(onCompleted: onCompleted),
    );
  }

  @override
  State<ConsultationPriceDialog> createState() =>
      _ConsultationPriceDialogState();
}

class _ConsultationPriceDialogState extends State<ConsultationPriceDialog> {
  int _price = 100;

  void _changePrice(int value) {
    setState(() => _price = (_price + value).clamp(0, 100000));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(minWidth: 0, maxWidth: 343.w),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 18.h),
          width: 343.w,
          height: 500.h,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.primaryColor, width: 1.2.w),
            boxShadow: const [
              BoxShadow(
                color: AppColors.primaryColor,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(Assets.imagesLogo, height: 165.h),
              SizedBox(height: 12.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'سعر الاستشارة',
                  style: AppStyles.bold16Primary.copyWith(fontSize: 22.sp),
                ),
              ),
              SizedBox(height: 14.h),
              _PriceControl(
                value: _price,
                onDecrease: () => _changePrice(-10),
                onIncrease: () => _changePrice(10),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'تحديد سعر الكشف بالكامل',
                  style: AppStyles.semiBold11primary.copyWith(fontSize: 17.sp),
                ),
              ),
              SizedBox(height: 12.h),
              const _DisabledPriceControl(value: 300),
              SizedBox(height: 38.h),
              SizedBox(
                width: 210.w,
                height: 60.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    widget.onCompleted?.call();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                  ),
                  child: Text(
                    'تمام',
                    style: AppStyles.bold16LightGrey.copyWith(fontSize: 18.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PriceControl extends StatelessWidget {
  const _PriceControl({
    required this.value,
    required this.onDecrease,
    required this.onIncrease,
  });
  final int value;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      _RoundIconButton(assetPath: Assets.svgsMiuns, onPressed: onDecrease),
      SizedBox(width: 8.w),
      Expanded(child: _PriceValue(value: value)),
      SizedBox(width: 8.w),
      _RoundIconButton(assetPath: Assets.svgsPlus, onPressed: onIncrease),
    ],
  );
}

class _DisabledPriceControl extends StatelessWidget {
  const _DisabledPriceControl({required this.value});
  final int value;

  @override
  Widget build(BuildContext context) => Opacity(
    opacity: .55,
    child: Row(
      children: [
        const _RoundIconButton(assetPath: Assets.svgsMiuns, onPressed: null),
        SizedBox(width: 8.w),
        Expanded(child: _PriceValue(value: value)),
        SizedBox(width: 8.w),
        const _RoundIconButton(assetPath: Assets.svgsPlus, onPressed: null),
      ],
    ),
  );
}

class _PriceValue extends StatelessWidget {
  const _PriceValue({required this.value});
  final int value;

  @override
  Widget build(BuildContext context) => Container(
    height: 36.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.scaffoldColor,
      border: Border.all(color: AppColors.primaryColor.withValues(alpha: .45)),
      borderRadius: BorderRadius.circular(7.r),
    ),
    child: Text(
      '$value',
      style: AppStyles.bold16Primary.copyWith(fontSize: 17.sp),
    ),
  );
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.assetPath, required this.onPressed});
  final String assetPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 30.h,
    width: 30.w,
    child: IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: SvgPicture.asset(assetPath, width: 29.w, height: 29.h),
    ),
  );
}
