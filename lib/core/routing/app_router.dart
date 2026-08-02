
import 'package:flutter/material.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/features/auth/login/ui/screens/login_screen.dart';
import 'package:salla7ly/features/auth/login/ui/screens/otp_screen.dart';
import 'package:salla7ly/features/auth/signup/ui/screens/signup_screen.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );
     

      default:
        return null;
    }
  }
}
