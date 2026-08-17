import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:salla7ly/core/networking/api_service.dart';
import 'package:salla7ly/core/networking/auth_interceptor.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();

    dio.options
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30)
      ..headers = {
        'Content-Type': 'application/json',
      };

    dio.interceptors.add(
      AuthInterceptor(dio),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    return dio;
  }

  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);
}