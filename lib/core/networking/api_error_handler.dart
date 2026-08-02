import 'package:dio/dio.dart';
import 'package:salla7ly/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return _createError(
            "connection_error",
            "Connection to server failed",
          );

        case DioExceptionType.cancel:
          return _createError(
            "request_cancelled",
            "Request to the server was cancelled",
          );

        case DioExceptionType.connectionTimeout:
          return _createError(
            "connection_timeout",
            "Connection timeout with the server",
          );

        case DioExceptionType.receiveTimeout:
          return _createError(
            "receive_timeout",
            "Receive timeout in connection with the server",
          );

        case DioExceptionType.sendTimeout:
          return _createError(
            "send_timeout",
            "Send timeout in connection with the server",
          );

        case DioExceptionType.unknown:
          return _createError(
            "unknown",
            "Connection to the server failed due to internet connection",
          );

        case DioExceptionType.badResponse:
          return _handleError(
            error.response?.statusCode,
            error.response?.data,
          );

        default:
          return _createError(
            "unknown_error",
            "Something went wrong",
          );
      }
    }

    return _createError(
      "unexpected_error",
      "Unexpected error occurred",
    );
  }

  static ApiErrorModel _handleError(
    int? statusCode,
    dynamic error,
  ) {
    if (error is Map<String, dynamic>) {
      final apiError = ApiErrorModel.fromJson(error);

      return ApiErrorModel(
        error: apiError.error,
        statusCode: statusCode,
      );
    }

    return ApiErrorModel(
      statusCode: statusCode,
      error: ErrorResponse(
        code: "unknown_error",
        message: "Unknown error occurred",
        details: [],
      ),
    );
  }

  static ApiErrorModel _createError(
    String code,
    String message,
  ) {
    return ApiErrorModel(
      error: ErrorResponse(
        code: code,
        message: message,
        details: [],
      ),
    );
  }
}