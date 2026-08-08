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
    as _i925;
import 'package:salla7ly/features/categories/domain/use_cases/categories_use_case.dart'
    as _i160;
import 'package:salla7ly/features/categories/logic/categories/categories_cubit.dart'
    as _i290;

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
    gh.lazySingleton<_i837.ApiService>(
      () => dioModule.apiService(gh<_i361.Dio>()),
    );
    gh.factory<_i711.CategoriesRemoteDataSource>(
      () => _i901.CategoriesRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i798.SignUpRemoteDataSource>(
      () => _i217.SignUpRemoteDataSourceImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i925.CategoriesRepo>(
      () => _i296.CategoriesRepoImpl(gh<_i711.CategoriesRemoteDataSource>()),
    );
    gh.factory<_i537.SignUpRepo>(
      () => _i1019.SignUpRepoImpl(gh<_i798.SignUpRemoteDataSource>()),
    );
    gh.factory<_i160.CategoriesUseCase>(
      () => _i160.CategoriesUseCase(gh<_i925.CategoriesRepo>()),
    );
    gh.factory<_i175.LoginRemoteDataSources>(
      () => _i893.LoginRemoteDataSourcesImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i247.LoginRepo>(
      () => _i209.LoginRepoImpl(gh<_i175.LoginRemoteDataSources>()),
    );
    gh.factory<_i158.SignUpUseCase>(
      () => _i158.SignUpUseCase(gh<_i537.SignUpRepo>()),
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
    gh.factory<_i290.CategoriesCubit>(
      () => _i290.CategoriesCubit(gh<_i160.CategoriesUseCase>()),
    );
    gh.factory<_i724.LoginCubit>(
      () => _i724.LoginCubit(
        gh<_i636.RefreshOtpUseCases>(),
        gh<_i828.VerifyOtpUseCases>(),
        gh<_i307.RequsetOtpUseCases>(),
      ),
    );
    gh.factory<_i813.SignupCubit>(
      () => _i813.SignupCubit(gh<_i158.SignUpUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i697.DioModule {}
