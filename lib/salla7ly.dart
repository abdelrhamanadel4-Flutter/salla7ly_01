import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/routing/app_router.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Salla7ly extends StatelessWidget {
  Salla7ly({
    super.key,
    required AppRouter appRouter,
    required this.initialRoute,
  }) : _appRouter = appRouter;
  final AppRouter _appRouter;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Salla7ly',
        theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldColor),
        locale: const Locale('ar'),
        supportedLocales: const [Locale('ar')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: DevicePreview.appBuilder(context, child),
          );
        },
        onGenerateRoute: _appRouter.generateRoute,
        initialRoute: initialRoute,
      ),
    );
  }
}
