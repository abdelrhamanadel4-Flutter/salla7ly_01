import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/features/auth/login/logic/login_cubit.dart';
import 'package:salla7ly/features/auth/login/ui/screens/login_screen.dart';
import 'package:salla7ly/features/auth/login/ui/screens/otp_screen.dart';
import 'package:salla7ly/features/auth/signup/logic/categories/categories_cubit.dart';
import 'package:salla7ly/features/auth/signup/logic/location/location_cubit.dart';
import 'package:salla7ly/features/auth/signup/logic/sign_up/sign_up_cubit.dart';
import 'package:salla7ly/features/auth/signup/ui/screens/map_screen.dart';
import 'package:salla7ly/features/auth/signup/ui/screens/signup_screen.dart';
import 'package:salla7ly/features/auth/signup/ui/screens/technician_acceptance_screen.dart';
import 'package:salla7ly/features/home/home_screen.dart';
import 'package:salla7ly/features/profile/ui/screens/profile_screen.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            child: const LoginScreen(),
            create: (context) => getIt<LoginCubit>(),
          ),
        );
      case Routes.otpScreen:
        final cubit = settings.arguments as LoginCubit?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit ?? getIt<LoginCubit>(),
            child: const OtpScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<SignupCubit>()),
              BlocProvider(
                create: (_) => getIt<CategoriesCubit>(),
              ),
            ],
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case Routes.mapScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LocationCubit>(),
            child: const MapScreen(),
          ),
        );
      case Routes.technicianAcceptanceScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const TechnicianAcceptanceScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
