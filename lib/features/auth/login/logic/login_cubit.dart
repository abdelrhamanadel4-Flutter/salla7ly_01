import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:salla7ly/core/helpers/constansts.dart';
import 'package:salla7ly/core/helpers/shared_pref_helper.dart';
import 'package:salla7ly/core/networking/api_error_model.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/auth/login/domain/entity/refresh_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_request.dart';
import 'package:salla7ly/features/auth/login/domain/use_cases/refresh_otp_use_cases.dart';
import 'package:salla7ly/features/auth/login/domain/use_cases/requset_otp_use_cases.dart';
import 'package:salla7ly/features/auth/login/domain/use_cases/verify_otp_use_cases.dart';
import 'package:salla7ly/features/auth/login/logic/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  RefreshOtpUseCases _refreshOtpUseCases;
  VerifyOtpUseCases _verifyOtpUseCases;
  RequsetOtpUseCases _requestOtpRequset;
  TextEditingController? phoneNoController= TextEditingController();
   final otpcontroller = PinInputController();
  LoginCubit(
    this._refreshOtpUseCases,
    this._verifyOtpUseCases,
    this._requestOtpRequset,
  ) : super(LoginState.initial());
  final formKey = GlobalKey<FormState>();
  Future<void> requestOtp(RequsetOtpRequset body) async {
    if (state is Loading) return;
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
    if (state is Loading) return;
    if (body.otpCode == null || body.otpCode!.trim().length < 4) {
      emit(LoginState.error(ApiErrorModel(error: ErrorResponse(message: 'من فضلك دخل الكود بالكامل'))));
      return;
    }
    emit(LoginState.loading());
    final result = await _verifyOtpUseCases.invoke(body);
    result.when(
      success: (data) async {
        final tokens = data.data?.tokens;
        if (tokens?.accessToken != null && tokens!.accessToken!.isNotEmpty) {
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken,
            tokens.accessToken!,
          );
        }
        if (tokens?.refreshToken != null && tokens!.refreshToken!.isNotEmpty) {
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.refreshToken,
            tokens.refreshToken!,
          );
        }
        if (data.data?.accountState != null) {
          await SharedPrefHelper.setData(
            SharedPrefKeys.accountState,
            data.data!.accountState!,
          );
        }
        if (data.data?.user?.role != null) {
          await SharedPrefHelper.setData(
            SharedPrefKeys.userRole,
            data.data!.user!.role!,
          );
        }
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.error(error));
      },
    );
  }
  Future<void> refreshOtp(RefreshOtpRequset body) async {
    if (state is Loading) return;
    emit(LoginState.loading());
    final result = await _refreshOtpUseCases.invoke(body);
    result.when(
      success: (data) async {
        final tokens = data.data?.tokens;
        if (tokens?.accessToken != null && tokens!.accessToken!.isNotEmpty) {
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken,
            tokens.accessToken!,
          );
        }
        if (tokens?.refreshToken != null && tokens!.refreshToken!.isNotEmpty) {
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.refreshToken,
            tokens.refreshToken!,
          );
        }
        if (data.data?.accountState != null) {
          await SharedPrefHelper.setData(
            SharedPrefKeys.accountState,
            data.data!.accountState!,
          );
        }
        if (data.data?.user?.role != null) {
          await SharedPrefHelper.setData(
            SharedPrefKeys.userRole,
            data.data!.user!.role!,
          );
        }
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.error(error));
      },
    );
  }
}
