import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/widgets/navigation/main_navigation_screen.dart';
import 'package:salla7ly/features/auth/login/logic/login_cubit.dart';
import 'package:salla7ly/features/auth/login/ui/screens/login_screen.dart';
import 'package:salla7ly/features/auth/login/ui/screens/otp_screen.dart';
import 'package:salla7ly/features/categories/logic/categories/categories_cubit.dart';
import 'package:salla7ly/features/auth/signup/logic/location/location_cubit.dart';
import 'package:salla7ly/features/auth/signup/logic/sign_up/sign_up_cubit.dart';
import 'package:salla7ly/features/auth/signup/ui/screens/map_screen.dart';
import 'package:salla7ly/features/auth/signup/ui/screens/signup_screen.dart';
import 'package:salla7ly/features/auth/signup/ui/screens/technician_acceptance_screen.dart';
import 'package:salla7ly/features/categories/ui/screens/categories_screen.dart';
import 'package:salla7ly/features/charging/charging_screen.dart';
import 'package:salla7ly/features/home/home_screen.dart';
import 'package:salla7ly/features/problem_description/ui/screens/ai_detection_screen.dart';
import 'package:salla7ly/features/problem_description/ui/screens/kind_of_problem_screen.dart';
import 'package:salla7ly/features/problem_description/ui/screens/problem_description_ai_screen.dart';
import 'package:salla7ly/features/problem_description/ui/screens/problem_description_screen.dart';
import 'package:salla7ly/features/problem_description/ui/screens/question_screen.dart';
import 'package:salla7ly/features/problem_description/ui/screens/request_review_screen.dart';
import 'package:salla7ly/features/problem_description/ui/screens/request_technician_screen.dart';
import 'package:salla7ly/features/problem_description/ui/screens/tech_profile_customer_view_screen.dart';
import 'package:salla7ly/features/problem_description/ui/screens/waiting_request_screen.dart';
import 'package:salla7ly/features/profile/logic/profile_cubit.dart';
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
              BlocProvider(create: (_) => getIt<CategoriesCubit>()),
            ],
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ProfileCubit>()..getProfile(),
            child: const ProfileScreen(),
          ),
        );

      case Routes.kindOfProblemScreen:
        return MaterialPageRoute(builder: (_) => const KindOfProblemScreen());

      case Routes.problemDescriptionAiScreen:
        return MaterialPageRoute(
          builder: (_) => const ProblemDescriptionAiScreen(),
        );

      case Routes.problemDescriptionScreen:
        return MaterialPageRoute(
          builder: (_) => const ProblemDescriptionScreen(),
        );

   case Routes.questionscreen:
        return MaterialPageRoute(
          builder: (_) => const QuestionScreen(),
        );
      case Routes.aiDetectionScreen:
        return MaterialPageRoute(builder: (_) => const AiDetectionScreen());

      case Routes.requestTechnicianScreen:
        return MaterialPageRoute(
          builder: (_) => const RequestTechnicianScreen(),
        );
        
 case Routes.requestReviewScreen:
        return MaterialPageRoute(
          builder: (_) => const RequestReviewScreen(),
        );
      case Routes.techProfileCustomerViewScreen:
        return MaterialPageRoute(
          builder: (_) => const TechProfileCustomerViewScreen(),
        );

      case Routes.waitingRequestScreen:
        return MaterialPageRoute(builder: (_) => const WaitingRequestScreen());

      case Routes.chargingScreen:
        return MaterialPageRoute(builder: (_) => const ChargingScreen());

      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<CategoriesCubit>(),
            child: const CategoriesScreen(),
          ),
        );

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
      case Routes.mainnavigationscreen:
        return MaterialPageRoute(builder: (_) => const MainNavigationScreen());

      default:
        return null;
    }
  }
}
