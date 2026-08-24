import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/core/routing/routes.dart';
import 'package:salla7ly/core/widgets/navigation/tech/main_navigation_screen_tech.dart';
import 'package:salla7ly/core/widgets/navigation/user/main_navigation_screen.dart';
import 'package:salla7ly/features/ai_detection/logic/ai_estimation_cubit.dart';
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
import 'package:salla7ly/features/customer_account_in_tech_view/customer_account.dart';
import 'package:salla7ly/features/edit_profile/ui/screens/edit_profile_screan.dart';
import 'package:salla7ly/features/edit_profile_tech/ui/screens/edit_profile_screan_tech.dart';
import 'package:salla7ly/features/home/home_screen.dart';
import 'package:salla7ly/features/problem_description/logic/problem_description/problem_description_cubit.dart';
import 'package:salla7ly/features/orders/screens/orders_screen.dart';
import 'package:salla7ly/features/ai_detection/ui/screens/ai_detection_screen.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';
import 'package:salla7ly/features/problem_description/logic/accept_offer/accept_offer_cubit.dart';
import 'package:salla7ly/features/problem_description/logic/cancel_request/cancel_request_cubit.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_cubit.dart';
import 'package:salla7ly/features/problem_description/logic/request_offers/request_offers_cubit.dart';
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
import 'package:salla7ly/features/requsets/domain/entity/technician_job.dart';
import 'package:salla7ly/features/requsets/logic/submit_job_offer_cubit.dart';
import 'package:salla7ly/features/requsets/logic/technician_jobs_cubit.dart';
import 'package:salla7ly/features/requsets/ui/screens/requsets_screen.dart';
import 'package:salla7ly/features/reviews/ui/screens/reviews_screen.dart';
import 'package:salla7ly/features/reviews/logic/technician_reviews_cubit.dart';

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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ProfileCubit>()..getProfile(),
            child: const HomeScreen(),
          ),
        );

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ProfileCubit>()..getProfile(),
            child: const ProfileScreen(),
          ),
        );
      case Routes.editprofilescrean:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ProfileCubit>()..getProfile(),
            child: const EditProfileScrean(),
          ),
        );

      case Routes.kindOfProblemScreen:
        final categoryId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => KindOfProblemScreen(categoryId: categoryId),
        );

      case Routes.problemDescriptionAiScreen:
        final categoryId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProblemDescriptionCubit>(),
            child: ProblemDescriptionAiScreen(categoryId: categoryId),
          ),
        );

      case Routes.problemDescriptionScreen:
        final categoryId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProblemDescriptionCubit>(),
              ),
              BlocProvider(create: (context) => getIt<PublishCubit>()),
            ],
            child: ProblemDescriptionScreen(categoryId: categoryId),
          ),
        );

      case Routes.questionscreen:
        return MaterialPageRoute(builder: (_) => const QuestionScreen());
      case Routes.requsetsscreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<TechnicianJobsCubit>()..fetchJobs(),
            child: const RequsetsScreen(),
          ),
        );
      case Routes.ordersscreen:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());
      case Routes.editprofilescreantech:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ProfileCubit>()..getProfile(),
            child: const EditProfileScreanTech(),
          ),
        );

      case Routes.aiDetectionScreen:
        final requestId = settings.arguments as String;

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<AiEstimationCubit>()),
              BlocProvider(create: (context) => getIt<PublishCubit>()),
              BlocProvider(create: (context) => getIt<CancelRequestCubit>()),
            ],
            child: AiDetectionScreen(requestId: requestId),
          ),
        );

      case Routes.requestTechnicianScreen:
        final requestId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<RequestOffersCubit>()..loadOffers(requestId),
            child: RequestTechnicianScreen(requestId: requestId),
          ),
        );

      case Routes.requestReviewScreen:
        return MaterialPageRoute(builder: (_) => const RequestReviewScreen());
      case Routes.techProfileCustomerViewScreen:
        final offer = settings.arguments as CustomerOffer;
        final technicianId = offer.technician?.id;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<AcceptOfferCubit>()),
              BlocProvider(
                create: (_) {
                  final cubit = getIt<TechnicianReviewsCubit>();

                  if (technicianId != null && technicianId.isNotEmpty) {
                    cubit.getReviews(technicianId);
                  }

                  return cubit;
                },
              ),
            ],
            child: TechProfileCustomerViewScreen(offer: offer),
          ),
        );

      case Routes.waitingRequestScreen:

        final requestId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<CancelRequestCubit>(),
            child: WaitingRequestScreen(requestId: requestId),
          ),
        );

        
      case Routes.reviewsscreen:
        return MaterialPageRoute(builder: (_) => const ReviewsScreen());


      case Routes.chargingScreen:
        return MaterialPageRoute(builder: (_) => const ChargingScreen());
            case Routes.customeraccount:
        final job = settings.arguments as TechnicianJob;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SubmitJobOfferCubit>(),
            child: CustomerAccount(job: job),
          ),
        );

        

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
        final initialIndex = settings.arguments as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => MainNavigationScreen(initialIndex: initialIndex),
        );
      case Routes.mainnavigationscreentech:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationScreenTech(),
        );

      default:
        return null;
    }
  }
}
