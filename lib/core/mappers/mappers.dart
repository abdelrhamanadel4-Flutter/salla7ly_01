

import 'package:salla7ly/feature_user/auth/login/data/model/refresh_otp_requset_dto.dart';
import 'package:salla7ly/feature_user/auth/login/data/model/requset_otp_requset_dto.dart';
import 'package:salla7ly/feature_user/auth/login/data/model/requset_otp_response-dto.dart';
import 'package:salla7ly/feature_user/auth/login/data/model/verify_otp_request_dto.dart';
import 'package:salla7ly/feature_user/auth/login/data/model/verify_otp_response_dto.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/refresh_otp_requset.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/requset_otp_requset.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/requset_otp_response.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/verify_otp_request.dart';
import 'package:salla7ly/feature_user/auth/login/domain/entity/verify_otp_response.dart';

extension RequestOtpRequestMapper on RequsetOtpRequset {
  RequsetOtpRequsetDto toDto() {
    return RequsetOtpRequsetDto(
      phone: phone,
    );
  }
}

extension RequestOtpResponseMapper on RequsetOtpResponseDto {
  RequsetOtpResponse toEntity() {
    return RequsetOtpResponse(
      data: data?.toEntity(),
    );
  }
}

extension RequestOtpDataMapper on DataDtoRequsetOtpResponse {
  Data toEntity() {
    return Data(
      expiresAt: expiresAt,
      devOtpCode: devOtpCode,
    );
  }
}
extension VerifyOtpResponseMapper on VerifyOtpResponseDto {
  VerifyOtpResponse toEntity() {
    return VerifyOtpResponse(
      data: data?.toEntity(),
    );
  }
}

extension VerifyOtpRequestMapper on VerifyOtpRequestDto {
  VerifyOtpRequest toEntity() {
    return VerifyOtpRequest(
      phone: phone,
      otpCode: otpCode,
    );
  }
}

extension RefreshOtpRequestMapper on RefreshOtpRequsetDto {
  RefreshOtpRequset toEntity() {
    return RefreshOtpRequset(
      refreshToken: refreshToken,
    );
  }
}


extension DataVerifyOtpResponseMapper on DataDtoVerifyOtpResponse {
  DataVerifyOtpResponse toEntity() {
    return DataVerifyOtpResponse(
      user: user?.toEntity(),
      isNewUser: isNewUser,
      accountState: accountState,
      message: message,
      tokens: tokens?.toEntity(),
    );
  }
}

extension TokensMapper on TokensDToVerifyOtpResponse {
  Tokens toEntity() {
    return Tokens(
      tokenType: tokenType,
      accessToken: accessToken,
      expiresIn: expiresIn,
      refreshToken: refreshToken,
      refreshExpiresIn: refreshExpiresIn,
    );
  }
}

extension UserMapper on UserDto {
  User toEntity() {
    return User(
      id: id,
      fullName: fullName,
      phone: phone,
      role: role,
      status: status,
      city: city,
      address: address,
      latitude: latitude,
      longitude: longitude,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
extension RefreshOtpRequestDtoMapper on RefreshOtpRequset {
  RefreshOtpRequsetDto toDto() {
    return RefreshOtpRequsetDto(
      refreshToken: refreshToken,
    );
  }
}
extension VerifyOtpRequestDtoMapper on VerifyOtpRequest {
  VerifyOtpRequestDto toDto() {
    return VerifyOtpRequestDto(
      phone: phone,
      otpCode: otpCode,
    );
  }
}