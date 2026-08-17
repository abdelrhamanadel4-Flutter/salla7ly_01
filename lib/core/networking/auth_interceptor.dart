import 'package:dio/dio.dart';
import 'package:salla7ly/core/helpers/constansts.dart';
import 'package:salla7ly/core/helpers/shared_pref_helper.dart';
import 'package:salla7ly/core/networking/api_constants.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // مش 401 → سيبه يكمل عادي
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    // مهم جدًا:
    // لو الـ request اللي فشل هو refresh نفسه
    // متحاولش تعمل refresh تاني
    if (err.requestOptions.path == ApiConstants.refreshOtp) {
      handler.next(err);
      return;
    }

    try {
      final refreshToken =
          await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.refreshToken,
      );

      if (refreshToken.isEmpty) {
        handler.next(err);
        return;
      }

      /*
       * استخدم Dio منفصل للـ refresh
       * عشان الـ refresh request نفسه
       * ما يدخلش في AuthInterceptor.
       */
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      final response = await refreshDio.post(
        ApiConstants.refreshOtp,
        data: {
          'refreshToken': refreshToken,
        },
      );

      final tokens = response.data['data']?['tokens'];

      final newAccessToken =
          tokens?['accessToken'] as String?;

      final newRefreshToken =
          tokens?['refreshToken'] as String?;

      // مفيش Access Token جديد
      if (newAccessToken == null ||
          newAccessToken.isEmpty) {
        handler.next(err);
        return;
      }

      // حفظ Access Token الجديد
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        newAccessToken,
      );

      // لو السيرفر عمل Rotation للـ refresh token
      if (newRefreshToken != null &&
          newRefreshToken.isNotEmpty) {
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.refreshToken,
          newRefreshToken,
        );
      }

      // حط التوكن الجديد في الـ request القديم
      err.requestOptions.headers['Authorization'] =
          'Bearer $newAccessToken';

      // أعد تنفيذ الـ request
      final retryResponse = await dio.fetch(
        err.requestOptions,
      );

      handler.resolve(retryResponse);
    } catch (e) {
      handler.next(err);
    }
  }
}