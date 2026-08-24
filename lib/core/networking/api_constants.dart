class ApiConstants {
  static const String baseUrl = 'https://back.markwasfy00.xyz/';
  static const String requestOtp = 'api/v1/public/auth/request-otp';
  static const String verifyOtp = 'api/v1/public/auth/verify-otp';
  static const String refreshOtp = 'api/v1/public/auth/refresh';
  static const String signUp = 'api/v1/me/signup';
  static const String getCategories = 'api/v1/public/categories';
  static const String getProfile = 'api/v1/me';
  static const String request = 'api/v1/customer/requests';
  static const String aiEstimation = 'api/v1/customer/requests/{id}/ai-estimation';
  static const String publishRequest = 'api/v1/customer/requests/{id}/publish';
  static const String customerOffers = 'api/v1/customer/requests/{id}/offers';
  static const String acceptOffer =
      'api/v1/customer/requests/{id}/offers/{offerId}/accept';
  static const String technicianJobs = 'api/v1/technician/jobs';
  static const String submitJobOffer = 'api/v1/technician/jobs/{id}/offer';

  static String get socketUrl =>
      baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
