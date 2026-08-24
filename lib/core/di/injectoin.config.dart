// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:salla7ly/core/networking/api_service.dart' as _i837;
import 'package:salla7ly/core/networking/dio_module.dart' as _i697;
import 'package:salla7ly/core/networking/socket_service.dart' as _i188;
import 'package:salla7ly/features/ai_detection/data/data_source/ai_estimation_remote_data_source.dart'
    as _i156;
import 'package:salla7ly/features/ai_detection/data/data_source/ai_estimation_remote_data_source_impl.dart'
    as _i160;
import 'package:salla7ly/features/ai_detection/data/repo/ai_estimation_repo_impl.dart'
    as _i779;
import 'package:salla7ly/features/ai_detection/domain/repo/ai_estimation_repo.dart'
    as _i262;
import 'package:salla7ly/features/ai_detection/domain/use_cases/ai_estimation_use_case.dart'
    as _i134;
import 'package:salla7ly/features/ai_detection/logic/ai_estimation_cubit.dart'
    as _i329;
import 'package:salla7ly/features/auth/login/data/data_sources/remote/login_remote_data_sources.dart'
    as _i175;
import 'package:salla7ly/features/auth/login/data/data_sources/remote/login_remote_data_sources_impl.dart'
    as _i893;
import 'package:salla7ly/features/auth/login/data/repo/login_repo_impl.dart'
    as _i209;
import 'package:salla7ly/features/auth/login/domain/repo/login_repo.dart'
    as _i247;
import 'package:salla7ly/features/auth/login/domain/use_cases/refresh_otp_use_cases.dart'
    as _i636;
import 'package:salla7ly/features/auth/login/domain/use_cases/requset_otp_use_cases.dart'
    as _i307;
import 'package:salla7ly/features/auth/login/domain/use_cases/verify_otp_use_cases.dart'
    as _i828;
import 'package:salla7ly/features/auth/login/logic/login_cubit.dart' as _i724;
import 'package:salla7ly/features/auth/signup/data/data_sources/remote/sign_up_remote_data_source.dart'
    as _i798;
import 'package:salla7ly/features/auth/signup/data/data_sources/remote/sign_up_remote_data_source_impl.dart'
    as _i217;
import 'package:salla7ly/features/auth/signup/data/repo/sign_up_repo_impl.dart'
    as _i1019;
import 'package:salla7ly/features/auth/signup/domain/repo/sign_up_repo.dart'
    as _i537;
import 'package:salla7ly/features/auth/signup/domain/use_cases/sign_up_use_case.dart'
    as _i158;
import 'package:salla7ly/features/auth/signup/logic/location/location_cubit.dart'
    as _i694;
import 'package:salla7ly/features/auth/signup/logic/sign_up/sign_up_cubit.dart'
    as _i813;
import 'package:salla7ly/features/categories/data/data_source/categories_remote_data_source.dart'
    as _i711;
import 'package:salla7ly/features/categories/data/data_source/categories_remote_data_source_impl.dart'
    as _i901;
import 'package:salla7ly/features/categories/data/repo/categories_repo_impl.dart'
    as _i296;
import 'package:salla7ly/features/categories/domain/repo/categories_repo.dart'
    as _i926;
import 'package:salla7ly/features/categories/domain/use_cases/categories_use_case.dart'
    as _i161;
import 'package:salla7ly/features/categories/logic/categories/categories_cubit.dart'
    as _i290;
import 'package:salla7ly/features/problem_description/data/data_source/remote/accept_offer_remote_data_source.dart'
    as _i221;
import 'package:salla7ly/features/problem_description/data/data_source/remote/accept_offer_remote_data_source_impl.dart'
    as _i484;
import 'package:salla7ly/features/problem_description/data/data_source/remote/offers_remote_data_source.dart'
    as _i860;
import 'package:salla7ly/features/problem_description/data/data_source/remote/offers_remote_data_source_impl.dart'
    as _i902;
import 'package:salla7ly/features/problem_description/data/data_source/remote/problem_description_data_source.dart'
    as _i133;
import 'package:salla7ly/features/problem_description/data/data_source/remote/problem_description_data_source_impl.dart'
    as _i907;
import 'package:salla7ly/features/problem_description/data/data_source/remote/publish_remote_data_source.dart'
    as _i322;
import 'package:salla7ly/features/problem_description/data/data_source/remote/publish_remote_data_source_impl.dart'
    as _i941;
import 'package:salla7ly/features/problem_description/data/repo/accept_offer_repo_impl.dart'
    as _i162;
import 'package:salla7ly/features/problem_description/data/repo/offers_repo_impl.dart'
    as _i40;
import 'package:salla7ly/features/problem_description/data/repo/problem_description_repo_impl.dart'
    as _i384;
import 'package:salla7ly/features/problem_description/data/repo/publish_repo_impl.dart'
    as _i493;
import 'package:salla7ly/features/problem_description/domain/repo/accept_offer_repo.dart'
    as _i542;
import 'package:salla7ly/features/problem_description/domain/repo/offers_repo.dart'
    as _i881;
import 'package:salla7ly/features/problem_description/domain/repo/problem_description_repo.dart'
    as _i488;
import 'package:salla7ly/features/problem_description/domain/repo/publish_repo.dart'
    as _i624;
import 'package:salla7ly/features/problem_description/domain/use_cases/accept_offer_use_case.dart'
    as _i1007;
import 'package:salla7ly/features/problem_description/domain/use_cases/get_offers_use_case.dart'
    as _i663;
import 'package:salla7ly/features/problem_description/domain/use_cases/problem_description_use_case.dart'
    as _i733;
import 'package:salla7ly/features/problem_description/domain/use_cases/publish_use_case.dart'
    as _i1014;
import 'package:salla7ly/features/problem_description/logic/accept_offer/accept_offer_cubit.dart'
    as _i896;
import 'package:salla7ly/features/problem_description/logic/problem_description/problem_description_cubit.dart'
    as _i351;
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_cubit.dart'
    as _i899;
import 'package:salla7ly/features/problem_description/logic/request_offers/request_offers_cubit.dart'
    as _i437;
import 'package:salla7ly/features/orders/data/data_source/remote/customer_orders_remote_data_source.dart'
    as _i500;
import 'package:salla7ly/features/orders/data/repositories/customer_orders_repository_impl.dart'
    as _i501;
import 'package:salla7ly/features/orders/domain/repositories/customer_orders_repository.dart'
    as _i502;
import 'package:salla7ly/features/orders/domain/use_cases/get_customer_orders_use_case.dart'
    as _i503;
import 'package:salla7ly/features/orders/logic/customer_orders_cubit.dart'
    as _i504;
import 'package:salla7ly/features/profile/data/data_sources/remote/profile_remote_data_source.dart'
    as _i551;
import 'package:salla7ly/features/profile/data/data_sources/remote/profile_remote_data_source_impl.dart'
    as _i925;
import 'package:salla7ly/features/profile/data/repo/profile_repo_impl.dart'
    as _i108;
import 'package:salla7ly/features/profile/domain/repo/profile_repo.dart'
    as _i887;
import 'package:salla7ly/features/profile/domain/use_cases/get_profile_use_case.dart'
    as _i844;
import 'package:salla7ly/features/profile/domain/use_cases/update_profile_use_case.dart'
    as _i945;
import 'package:salla7ly/features/profile/logic/profile_cubit.dart' as _i334;
import 'package:salla7ly/features/requsets/data/data_source/remote/technician_jobs_remote_data_source.dart'
    as _i234;
import 'package:salla7ly/features/requsets/data/repo/technician_jobs_repo_impl.dart'
    as _i375;
import 'package:salla7ly/features/requsets/domain/repo/technician_jobs_repo.dart'
    as _i744;
import 'package:salla7ly/features/requsets/domain/use_cases/get_technician_jobs_use_case.dart'
    as _i489;
import 'package:salla7ly/features/requsets/domain/use_cases/submit_job_offer_use_case.dart'
    as _i1048;
import 'package:salla7ly/features/requsets/logic/submit_job_offer_cubit.dart'
    as _i44;
import 'package:salla7ly/features/requsets/logic/technician_jobs_cubit.dart'
    as _i1030;
import 'package:salla7ly/features/reviews/data/data_sources/remote/technician_reviews_remote_data_source.dart'
    as _i110;
import 'package:salla7ly/features/reviews/data/repo/technician_reviews_repo_impl.dart'
    as _i111;
import 'package:salla7ly/features/reviews/domain/repo/technician_reviews_repo.dart'
    as _i112;
import 'package:salla7ly/features/reviews/domain/use_cases/get_technician_reviews_use_case.dart'
    as _i113;
import 'package:salla7ly/features/reviews/logic/technician_reviews_cubit.dart'
    as _i114;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i694.LocationCubit>(() => _i694.LocationCubit());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i188.SocketService>(() => _i188.SocketService());
    gh.lazySingleton<_i837.ApiService>(
      () => dioModule.apiService(gh<_i361.Dio>()),
    );
    gh.factory<_i860.OffersRemoteDataSource>(
      () => _i902.OffersRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i156.AiEstimationRemoteDataSource>(
      () => _i160.AiEstimationRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i551.ProfileRemoteDataSource>(
      () => _i925.ProfileRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i711.CategoriesRemoteDataSource>(
      () => _i901.CategoriesRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i221.AcceptOfferRemoteDataSource>(
      () => _i484.AcceptOfferRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i234.TechnicianJobsRemoteDataSource>(
      () => _i234.TechnicianJobsRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i110.TechnicianReviewsRemoteDataSource>(
      () => _i110.TechnicianReviewsRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i500.CustomerOrdersRemoteDataSource>(
      () => _i500.CustomerOrdersRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i881.OffersRepo>(
      () => _i40.OffersRepoImpl(gh<_i860.OffersRemoteDataSource>()),
    );
    gh.factory<_i798.SignUpRemoteDataSource>(
      () => _i217.SignUpRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i537.SignUpRepo>(
      () => _i1019.SignUpRepoImpl(gh<_i798.SignUpRemoteDataSource>()),
    );
    gh.factory<_i133.ProblemDescriptionRemoteDataSource>(
      () => _i907.ProblemDescriptionDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i322.PublishRemoteDataSource>(
      () => _i941.PublishRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i926.CategoriesRepo>(
      () => _i296.CategoriesRepoImpl(gh<_i711.CategoriesRemoteDataSource>()),
    );
    gh.factory<_i161.CategoriesUseCase>(
      () => _i161.CategoriesUseCase(gh<_i926.CategoriesRepo>()),
    );
    gh.factory<_i175.LoginRemoteDataSources>(
      () => _i893.LoginRemoteDataSourcesImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i262.AiEstimationRepo>(
      () =>
          _i779.AiEstimationRepoImpl(gh<_i156.AiEstimationRemoteDataSource>()),
    );
    gh.factory<_i247.LoginRepo>(
      () => _i209.LoginRepoImpl(gh<_i175.LoginRemoteDataSources>()),
    );
    gh.factory<_i542.AcceptOfferRepo>(
      () => _i162.AcceptOfferRepoImpl(gh<_i221.AcceptOfferRemoteDataSource>()),
    );
    gh.factory<_i624.PublishRepo>(
      () => _i493.PublishRepoImpl(gh<_i322.PublishRemoteDataSource>()),
    );
    gh.factory<_i663.GetOffersUseCase>(
      () => _i663.GetOffersUseCase(gh<_i881.OffersRepo>()),
    );
    gh.factory<_i134.AiEstimationUseCase>(
      () => _i134.AiEstimationUseCase(gh<_i262.AiEstimationRepo>()),
    );
    gh.factory<_i329.AiEstimationCubit>(
      () => _i329.AiEstimationCubit(gh<_i134.AiEstimationUseCase>()),
    );
    gh.factory<_i887.ProfileRepo>(
      () => _i108.ProfileRepoImpl(gh<_i551.ProfileRemoteDataSource>()),
    );
    gh.factory<_i744.TechnicianJobsRepo>(
      () => _i375.TechnicianJobsRepoImpl(
        gh<_i234.TechnicianJobsRemoteDataSource>(),
      ),
    );
    gh.factory<_i112.TechnicianReviewsRepo>(
      () => _i111.TechnicianReviewsRepoImpl(
        gh<_i110.TechnicianReviewsRemoteDataSource>(),
      ),
    );
    gh.factory<_i502.CustomerOrdersRepository>(
      () => _i501.CustomerOrdersRepositoryImpl(
        gh<_i500.CustomerOrdersRemoteDataSource>(),
      ),
    );
    gh.factory<_i158.SignUpUseCase>(
      () => _i158.SignUpUseCase(gh<_i537.SignUpRepo>()),
    );
    gh.factory<_i844.GetProfileUseCase>(
      () => _i844.GetProfileUseCase(gh<_i887.ProfileRepo>()),
    );
    gh.factory<_i945.UpdateProfileUseCase>(
      () => _i945.UpdateProfileUseCase(gh<_i887.ProfileRepo>()),
    );
    gh.factory<_i1007.AcceptOfferUseCase>(
      () => _i1007.AcceptOfferUseCase(gh<_i542.AcceptOfferRepo>()),
    );
    gh.factory<_i489.GetTechnicianJobsUseCase>(
      () => _i489.GetTechnicianJobsUseCase(gh<_i744.TechnicianJobsRepo>()),
    );
    gh.factory<_i113.GetTechnicianReviewsUseCase>(
      () =>
          _i113.GetTechnicianReviewsUseCase(gh<_i112.TechnicianReviewsRepo>()),
    );
    gh.factory<_i503.GetCustomerOrdersUseCase>(
      () =>
          _i503.GetCustomerOrdersUseCase(gh<_i502.CustomerOrdersRepository>()),
    );
    gh.factory<_i1048.SubmitJobOfferUseCase>(
      () => _i1048.SubmitJobOfferUseCase(gh<_i744.TechnicianJobsRepo>()),
    );
    gh.factory<_i636.RefreshOtpUseCases>(
      () => _i636.RefreshOtpUseCases(gh<_i247.LoginRepo>()),
    );
    gh.factory<_i307.RequsetOtpUseCases>(
      () => _i307.RequsetOtpUseCases(gh<_i247.LoginRepo>()),
    );
    gh.factory<_i828.VerifyOtpUseCases>(
      () => _i828.VerifyOtpUseCases(gh<_i247.LoginRepo>()),
    );
    gh.factory<_i437.RequestOffersCubit>(
      () => _i437.RequestOffersCubit(
        gh<_i663.GetOffersUseCase>(),
        gh<_i188.SocketService>(),
      ),
    );
    gh.factory<_i488.ProblemDescriptionRepo>(
      () => _i384.ProblemDescriptionRepositoryImpl(
        gh<_i133.ProblemDescriptionRemoteDataSource>(),
      ),
    );
    gh.factory<_i1014.PublishUseCase>(
      () => _i1014.PublishUseCase(gh<_i624.PublishRepo>()),
    );
    gh.factory<_i1030.TechnicianJobsCubit>(
      () => _i1030.TechnicianJobsCubit(
        gh<_i489.GetTechnicianJobsUseCase>(),
        gh<_i188.SocketService>(),
      ),
    );
    gh.factory<_i114.TechnicianReviewsCubit>(
      () =>
          _i114.TechnicianReviewsCubit(gh<_i113.GetTechnicianReviewsUseCase>()),
    );
    gh.factory<_i504.CustomerOrdersCubit>(
      () => _i504.CustomerOrdersCubit(gh<_i503.GetCustomerOrdersUseCase>()),
    );
    gh.factory<_i899.PublishCubit>(
      () => _i899.PublishCubit(gh<_i1014.PublishUseCase>()),
    );
    gh.factory<_i290.CategoriesCubit>(
      () => _i290.CategoriesCubit(gh<_i161.CategoriesUseCase>()),
    );
    gh.factory<_i724.LoginCubit>(
      () => _i724.LoginCubit(
        gh<_i636.RefreshOtpUseCases>(),
        gh<_i828.VerifyOtpUseCases>(),
        gh<_i307.RequsetOtpUseCases>(),
      ),
    );
    gh.factory<_i334.ProfileCubit>(
      () => _i334.ProfileCubit(
        gh<_i844.GetProfileUseCase>(),
        gh<_i945.UpdateProfileUseCase>(),
      ),
    );
    gh.factory<_i896.AcceptOfferCubit>(
      () => _i896.AcceptOfferCubit(gh<_i1007.AcceptOfferUseCase>()),
    );
    gh.factory<_i813.SignupCubit>(
      () => _i813.SignupCubit(gh<_i158.SignUpUseCase>()),
    );
    gh.factory<_i44.SubmitJobOfferCubit>(
      () => _i44.SubmitJobOfferCubit(gh<_i1048.SubmitJobOfferUseCase>()),
    );
    gh.factory<_i733.ProblemDescriptionUseCase>(
      () => _i733.ProblemDescriptionUseCase(gh<_i488.ProblemDescriptionRepo>()),
    );
    gh.factory<_i351.ProblemDescriptionCubit>(
      () =>
          _i351.ProblemDescriptionCubit(gh<_i733.ProblemDescriptionUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i697.DioModule {}
