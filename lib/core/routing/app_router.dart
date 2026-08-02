
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/feature_user/auth/login/ui/login_screan.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settinges) {
    switch (settinges.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
     

      default:
        return null;
    }
  }
}
