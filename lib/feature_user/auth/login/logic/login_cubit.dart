import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/refresh_otp_requset.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/requset_otp_requset.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/verify_otp_request.dart';
import 'package:salla7ly/feature_user/auth/login/domain/use_cases/refresh_otp_use_cases.dart';
import 'package:salla7ly/feature_user/auth/login/domain/use_cases/requset_otp_use_cases.dart';
import 'package:salla7ly/feature_user/auth/login/domain/use_cases/verify_otp_use_cases.dart';
import 'package:salla7ly/feature_user/auth/login/logic/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  RefreshOtpUseCases _refreshOtpUseCases;
  VerifyOtpUseCases _verifyOtpUseCases;
  RequsetOtpUseCases _requestOtpRequset;
  LoginCubit(
    this._refreshOtpUseCases,
    this._verifyOtpUseCases,
    this._requestOtpRequset,
  ) : super(LoginState.initial());
  final formKey = GlobalKey<FormState>();
  Future<void> requestOtp(RequsetOtpRequset body) async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginState.loading());
      final result = await _requestOtpRequset.invoke(body);
      result.when(
        success: (data) async {
          emit(LoginState.success(data));
        },
        failure: (error) {
          emit(LoginState.error(error));
        },
      );
    }
  }
  Future<void> verifyOtp(VerifyOtpRequest body) async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginState.loading());
      final result = await _verifyOtpUseCases.invoke(body);
      result.when(
        success: (data) async {
          emit(LoginState.success(data));
        },
        failure: (error) {
          emit(LoginState.error(error));
        },
      );
    }
  }
  Future<void> refreshOtp(RefreshOtpRequset body) async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginState.loading());
      final result = await _refreshOtpUseCases.invoke(body);
      result.when(
        success: (data) async {
          emit(LoginState.success(data));
        },
        failure: (error) {
          emit(LoginState.error(error));
        },
      );
    }
  }
}
