import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/core/helpers/constansts.dart';
import 'package:salla7ly/core/helpers/shared_pref_helper.dart';
import 'package:salla7ly/core/routing/app_router.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/salla7ly.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  final token = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  final accountState = await SharedPrefHelper.getString(
    SharedPrefKeys.accountState,
  );

  String initialRoute;
  if (token.isEmpty) {
    initialRoute = Routes.loginScreen;
  } else if (accountState == 'WAITING_FOR_APPROVAL') {
    initialRoute = Routes.technicianAcceptanceScreen;
  } else if (accountState == 'COMPLETE_PROFILE') {
    initialRoute = Routes.signupScreen;
  } else {
    initialRoute = Routes.mainnavigationscreen;
  }

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
          Salla7ly(appRouter: AppRouter(), initialRoute: initialRoute),
    ),
  );
}
