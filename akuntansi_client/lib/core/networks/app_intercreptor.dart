import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../utils/helper.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"content-type": "application/json; charset=utf-8"});
    options.headers.addAll({"Accept": "application/json"});

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;

    if (statusCode == HttpStatus.unprocessableEntity) {
      dismissLoading();
      await sessionLogOut().then(
        (_) => Navigator.pushNamedAndRemoveUntil(
          GlobalKey<NavigatorState>().currentContext!,
          LoginPage.routeName,
          (route) => false,
        ),
      );
    }

    if (statusCode == HttpStatus.forbidden) {}

    return super.onError(err, handler);
  }
}
