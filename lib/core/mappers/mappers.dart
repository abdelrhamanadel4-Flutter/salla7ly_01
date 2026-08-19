import 'package:dio/dio.dart';
import 'package:salla7ly/features/auth/login/data/model/refresh_otp_requset_dto.dart';
import 'package:salla7ly/features/auth/login/data/model/requset_otp_requset_dto.dart';
import 'package:salla7ly/features/auth/login/data/model/requset_otp_response-dto.dart';
import 'package:salla7ly/features/auth/login/data/model/verify_otp_request_dto.dart';
import 'package:salla7ly/features/auth/login/data/model/verify_otp_response_dto.dart';
import 'package:salla7ly/features/auth/login/domain/entity/refresh_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_requset.dart';
import 'package:salla7ly/features/auth/login/domain/entity/requset_otp_response.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_request.dart';
import 'package:salla7ly/features/auth/login/domain/entity/verify_otp_response.dart';
import 'package:salla7ly/features/categories/data/models/categories_response_dto.dart';
import 'package:salla7ly/features/auth/signup/data/model/sign_up_responsedto.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_requset_entity.dart';
import 'package:salla7ly/features/auth/signup/domain/entity/sign_up_response.dart';
import 'package:salla7ly/features/categories/domain/entity/categories_responce.dart';
import 'package:salla7ly/features/problem_description/data/models/problem_description_request_dto.dart';
import 'package:salla7ly/features/problem_description/data/models/problem_description_response_dto.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_request.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_response.dart';
import 'package:salla7ly/features/profile/data/model/profile_response_dto.dart';
import 'package:salla7ly/features/profile/domain/entity/profile_response.dart';

extension RequestOtpRequestMapper on RequsetOtpRequset {
  RequsetOtpRequsetDto toDto() {
    return RequsetOtpRequsetDto(phone: phone);
  }
}

extension RequestOtpResponseMapper on RequsetOtpResponseDto {
  RequsetOtpResponse toEntity() {
    return RequsetOtpResponse(data: data?.toEntity());
  }
}

extension RequestOtpDataMapper on DataDtoRequsetOtpResponse {
  Data toEntity() {
    return Data(expiresAt: expiresAt, devOtpCode: devOtpCode);
  }
}

extension VerifyOtpResponseMapper on VerifyOtpResponseDto {
  VerifyOtpResponse toEntity() {
    return VerifyOtpResponse(data: data?.toEntity());
  }
}

extension VerifyOtpRequestMapper on VerifyOtpRequestDto {
  VerifyOtpRequest toEntity() {
    return VerifyOtpRequest(phone: phone, otpCode: otpCode);
  }
}

extension RefreshOtpRequestMapper on RefreshOtpRequsetDto {
  RefreshOtpRequset toEntity() {
    return RefreshOtpRequset(refreshToken: refreshToken);
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
    return RefreshOtpRequsetDto(refreshToken: refreshToken);
  }
}

extension VerifyOtpRequestDtoMapper on VerifyOtpRequest {
  VerifyOtpRequestDto toDto() {
    return VerifyOtpRequestDto(phone: phone, otpCode: otpCode);
  }
}

extension SignupRequestMapper on SignupRequest {
  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('fullName', fullName),
      MapEntry('city', city),
      MapEntry('address', address),
      MapEntry('latitude', latitude.toString()),
      MapEntry('longitude', longitude.toString()),
      MapEntry('role', role),
    ]);

    if (categoryId != null) {
      formData.fields.add(MapEntry('categoryId', categoryId!));
    }

    if (nationalId != null) {
      formData.fields.add(MapEntry('nationalId', nationalId!));
    }

    if (criminalRecordFile != null) {
      formData.files.add(
        MapEntry(
          'criminalRecordFile',
          await MultipartFile.fromFile(
            criminalRecordFile!.path,
            filename: criminalRecordFile!.path.split('/').last,
          ),
        ),
      );
    }

    if (profileImage != null) {
      formData.files.add(
        MapEntry(
          'profileImage',
          await MultipartFile.fromFile(
            profileImage!.path,
            filename: profileImage!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}

extension SignUpResponseDtoMapper on SignUpResponsedto {
  SignUpResponse toEntity() {
    return SignUpResponse(data: data?.toEntity());
  }
}

extension DataDtoSignUpResponseMapper on DataDtoSignUpResponse {
  DataSignUpResponse toEntity() {
    return DataSignUpResponse(
      user: user?.toEntity(),
      technicianProfile: technicianProfile?.toEntity(),
      accountState: accountState,
      message: message,
    );
  }
}

extension UserDtoSignUpResponseMapper on UserDtoSignUpResponse {
  UserSignUpResponse toEntity() {
    return UserSignUpResponse(
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

extension TechnicianProfileDtoMapper on TechnicianProfileDto {
  TechnicianProfile toEntity() {
    return TechnicianProfile(
      id: id,
      UserId: userId,
      categoryId: categoryId,
      verificationStatus: verificationStatus,
      isAvailable: isAvailable,
      overallRating: overallRating,
      totalReviews: totalReviews,
      profileImage: profileImage,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

////////////////////////////////////////////////////////////////
/// Entity -> DTO
////////////////////////////////////////////////////////////////

extension SignUpResponseMapper on SignUpResponse {
  SignUpResponsedto toDto() {
    return SignUpResponsedto(data: data?.toDto());
  }
}

extension DataSignUpResponseMapper on DataSignUpResponse {
  DataDtoSignUpResponse toDto() {
    return DataDtoSignUpResponse(
      user: user?.toDto(),
      technicianProfile: technicianProfile?.toDto(),
      accountState: accountState,
      message: message,
    );
  }
}

extension UserSignUpResponseMapper on UserSignUpResponse {
  UserDtoSignUpResponse toDto() {
    return UserDtoSignUpResponse(
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

extension TechnicianProfileMapper on TechnicianProfile {
  TechnicianProfileDto toDto() {
    return TechnicianProfileDto(
      id: id,
      userId: userId,
      categoryId: categoryId,
      verificationStatus: verificationStatus,
      isAvailable: isAvailable,
      overallRating: overallRating,
      totalReviews: totalReviews,
      profileImage: profileImage,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension CatgireosResponseDtoMapper on CategoriesResponseDto {
  CategoriesResponse toEntity() {
    return CategoriesResponse(data: data?.map((e) => e?.toEntity()).toList());
  }
}

extension DataDtoCatgireosResponseMapper on DataDtoCategoriesResponse {
  DataCategoriesResponse toEntity() {
    return DataCategoriesResponse(id: id, name: name);
  }
}

extension CatgireosResponseEntityMapper on CategoriesResponse {
  CategoriesResponseDto toDto() {
    return CategoriesResponseDto(data: data?.map((e) => e?.toDto()).toList());
  }
}

extension DataCatgireosResponseEntityMapper on DataCategoriesResponse {
  DataDtoCategoriesResponse toDto() {
    return DataDtoCategoriesResponse(
      id: id,
      name: name,
      homeVisitBasePrice: null,
      createdAt: null,
      updatedAt: null,
    );
  }
}

extension ProfileResponseDtoMapper on ProfileResponseDto {
  ProfileResponse toEntity() {
    return ProfileResponse(data: data?.toEntity());
  }
}

extension DataProfileResponseDtoMapper on DataProfileResponseDto {
  DataProfileResponse toEntity() {
    return DataProfileResponse(
      user: user?.toEntity(),
      technician: technician?.toEntity(),
      accountState: accountState,
      message: message,
    );
  }
}

extension UserProfileResponseDtoMapper on UserProfileResponseDto {
  UserProfileResponse toEntity() {
    return UserProfileResponse(
      id: id,
      fullName: fullName,
      pointsBalance: pointsBalance,
    );
  }
}

extension TechnicianProfileResponseDtoMapper on TechnicianProfileResponseDto {
  TechnicianProfileResponse toEntity() {
    return TechnicianProfileResponse(profileImage: profileImage);
  }
}

extension ProblemDescriptionRequestMapper on ProblemDescriptionRequest {
  ProblemDescriptionRequestDto toDto() {
    return ProblemDescriptionRequestDto(
      title: title,
      description: description,
      categoryId: categoryId,
      requestType: requestType,
      images: images,
      serviceAddress: serviceAddress,
      serviceCity: serviceCity,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension ProblemDescriptionResponseDtoMapper on ProblemDescriptionResponseDto {
  ProblemDescriptionResponse toEntity() {
    return ProblemDescriptionResponse(
        data: data?.toEntity()
    );
  }
}

extension DataProblemDescriptionResponseDtoMapper on DataProblemDescriptionResponseDto {
  DataProblemDescriptionResponse toEntity() {
    return DataProblemDescriptionResponse(
      id: id,
      categoryId: categoryId,
      categoryName: categoryName,
      requestType: requestType,
      title: title,
      description: description,
      status: status,
      serviceAddress: serviceAddress,
      serviceCity: serviceCity,
      serviceLatitude: serviceLatitude,
      serviceLongitude: serviceLongitude,
      images: images,
      offersCount: offersCount,
    );
  }
}


