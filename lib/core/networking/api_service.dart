import 'dart:core';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:salla7ly/core/networking/api_constants.dart';
import 'package:salla7ly/features/ai_detection/data/model/ai_estimation_response_dto.dart';
import 'package:salla7ly/features/auth/login/data/model/refresh_otp_requset_dto.dart';
import 'package:salla7ly/features/auth/login/data/model/requset_otp_requset_dto.dart';
import 'package:salla7ly/features/auth/login/data/model/requset_otp_response-dto.dart';
import 'package:salla7ly/features/auth/login/data/model/verify_otp_request_dto.dart';
import 'package:salla7ly/features/auth/login/data/model/verify_otp_response_dto.dart';
import 'package:salla7ly/features/categories/data/models/categories_response_dto.dart';
import 'package:salla7ly/features/auth/signup/data/model/sign_up_responsedto.dart';
import 'package:salla7ly/features/problem_description/data/models/accept_offer_response_dto.dart';
import 'package:salla7ly/features/problem_description/data/models/offers_response_dto.dart';
import 'package:salla7ly/features/problem_description/data/models/problem_description_response_dto.dart';
import 'package:salla7ly/features/problem_description/data/models/publish_request_response_dto.dart';
import 'package:salla7ly/features/profile/data/model/profile_response_dto.dart';
import 'package:salla7ly/features/orders/data/models/customer_orders_response_dto.dart';
import 'package:salla7ly/features/requsets/data/models/submit_job_offer_dto.dart';
import 'package:salla7ly/features/requsets/data/models/technician_jobs_response_dto.dart';
import 'package:salla7ly/features/reviews/data/models/customer_tech_reviews_response_dto.dart';

import 'package:salla7ly/features/reviews/data/models/technician_reviews_response_dto.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
  @POST(ApiConstants.requestOtp)
  Future<RequsetOtpResponseDto> requestOtp(@Body() RequsetOtpRequsetDto body);

  @POST(ApiConstants.verifyOtp)
  Future<VerifyOtpResponseDto> verifyOtp(@Body() VerifyOtpRequestDto body);

  @POST(ApiConstants.refreshOtp)
  Future<VerifyOtpResponseDto> refreshOtp(@Body() RefreshOtpRequsetDto body);
  @POST(ApiConstants.signUp)
  Future<SignUpResponsedto> signUp(@Body() FormData formData);
  @GET(ApiConstants.getCategories)
  Future<CategoriesResponseDto> getCategories();

  @GET(ApiConstants.getProfile)
  Future<ProfileResponseDto> getProfile();

  @PATCH(ApiConstants.getProfile)
  Future<ProfileResponseDto> updateProfile(@Body() Map<String, dynamic> body);

  @PATCH(ApiConstants.getProfile)
  Future<ProfileResponseDto> updateProfileWithImage(@Body() FormData body);

  @POST(ApiConstants.request)
  Future<ProblemDescriptionResponseDto> createProblemDescription(
    @Body() FormData formData,
  );

  @POST(ApiConstants.aiEstimation)
  Future<AiEstimationResponseDto> getAiEstimation(@Path('id') String id);

  @POST(ApiConstants.publishRequest)
  Future<PublishRequestResponseDto> publishRequest(@Path('id') String id);

  @GET(ApiConstants.customerOffers)
  Future<OffersResponseDto> getOffers(@Path('id') String id);

  @POST(ApiConstants.acceptOffer)
  Future<AcceptOfferResponseDto> acceptOffer(
    @Path('id') String id,
    @Path('offerId') String offerId,
  );

  @GET(ApiConstants.request)
  Future<CustomerOrdersResponseDto> getCustomerOrders({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('status') String? status,
  });

  @GET(ApiConstants.technicianJobs)
  Future<TechnicianJobsResponseDto> getTechnicianJobs({
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('status') String? status,
  });

  @POST(ApiConstants.submitJobOffer)
  Future<SubmitJobOfferResponseDto> submitJobOffer(
    @Path('id') String id,
    @Body() SubmitJobOfferDto body,
  );

  @GET(ApiConstants.customerTechReviews)
  Future<CustomerTechReviewsResponseDto> getCustomerTechReviews(
    @Path('id') String id, {
      @Query('page') int page = 1,
    @Query('limit') int limit = 20,
  });

  @GET(ApiConstants.notifications)
  Future<Map<String, dynamic>> getNotifications({
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
  });

  
  @POST(ApiConstants.cancelRequest)
  Future<ProblemDescriptionResponseDto> cancelRequest(@Path('id') String id);



  @GET(ApiConstants.notificationsUnreadCount)
  Future<Map<String, dynamic>> getNotificationsUnreadCount();

  @PATCH(ApiConstants.notificationsReadAll)
  Future<Map<String, dynamic>> markAllNotificationsAsRead();

  @GET(ApiConstants.technicianReviews)
  Future<TechnicianReviewsResponseDto> getTechnicianReviews({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

}
