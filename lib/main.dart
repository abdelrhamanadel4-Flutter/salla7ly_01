import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:salla7ly/core/routing/app_router.dart';
import 'package:salla7ly/salla7ly.dart';
void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => Salla7ly(appRouter: AppRouter()),
    ),
  );
}
