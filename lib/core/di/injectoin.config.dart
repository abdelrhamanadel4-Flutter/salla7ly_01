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
import 'package:salla7ly/feature_user/auth/login/data/data_sources/remote/login_remote_data_sources.dart'
    as _i204;
import 'package:salla7ly/feature_user/auth/login/data/data_sources/remote/login_remote_data_sources_impl.dart'
    as _i99;
import 'package:salla7ly/feature_user/auth/login/data/repo/login_repo_impl.dart'
    as _i306;
import 'package:salla7ly/feature_user/auth/login/domain/repo/login_repo.dart'
    as _i521;
import 'package:salla7ly/feature_user/auth/login/domain/use_cases/refresh_otp_use_cases.dart'
    as _i815;
import 'package:salla7ly/feature_user/auth/login/domain/use_cases/requset_otp_use_cases.dart'
    as _i34;
import 'package:salla7ly/feature_user/auth/login/domain/use_cases/verify_otp_use_cases.dart'
    as _i443;
import 'package:salla7ly/feature_user/auth/login/logic/login_cubit.dart'
    as _i864;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i837.ApiService>(
      () => dioModule.apiService(gh<_i361.Dio>()),
    );
    gh.factory<_i204.LoginRemoteDataSources>(
      () => _i99.LoginRemoteDataSourcesImpl(gh<_i837.ApiService>()),
    );
    gh.factory<_i521.LoginRepo>(
      () => _i306.LoginRepoImpl(gh<_i204.LoginRemoteDataSources>()),
    );
    gh.factory<_i815.RefreshOtpUseCases>(
      () => _i815.RefreshOtpUseCases(gh<_i521.LoginRepo>()),
    );
    gh.factory<_i34.RequsetOtpUseCases>(
      () => _i34.RequsetOtpUseCases(gh<_i521.LoginRepo>()),
    );
    gh.factory<_i443.VerifyOtpUseCases>(
      () => _i443.VerifyOtpUseCases(gh<_i521.LoginRepo>()),
    );
    gh.factory<_i864.LoginCubit>(
      () => _i864.LoginCubit(
        gh<_i815.RefreshOtpUseCases>(),
        gh<_i443.VerifyOtpUseCases>(),
        gh<_i34.RequsetOtpUseCases>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i697.DioModule {}
