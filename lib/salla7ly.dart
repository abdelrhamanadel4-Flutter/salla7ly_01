import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/routing/app_router.dart';
import 'package:salla7ly/core/theming/app_color.dart';

class Salla7ly extends StatelessWidget {
   Salla7ly({super.key, required this._appRouter});
  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Salla7ly',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldColor,
        ),
           onGenerateRoute: _appRouter.generateRoute,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}