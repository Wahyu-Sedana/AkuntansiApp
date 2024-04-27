import 'package:akuntansi_client/core/services/api_setting.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

import 'app_intercreptor.dart';

class DioClient {
  static late Dio _dio;
  final AppInterceptor appInterceptor = AppInterceptor();
  addInterception() {
    _dio.interceptors.addAll([appInterceptor, dioLoggerInterceptor]);
  }

  DioClient({String base = baseUrl}) {
    _dio = Dio(BaseOptions(
      baseUrl: base,
      validateStatus: (status) => (status! >= 200) && (status <= 422),
    ));
    addInterception();
  }

  Dio get dio => _dio;
}
