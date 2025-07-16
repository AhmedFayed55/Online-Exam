import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/core/constants/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    Dio dio = Dio();
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.headers = {'Content-Type': 'application/json'};
    dio.interceptors.add(getIt.get<PrettyDioLogger>());
    return dio;
  }

  @lazySingleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    );
  }
}
