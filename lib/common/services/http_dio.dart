import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpDio {
  final Dio dio = createDio();

  static const baseUrl = 'https://stocio-backend.vercel.app';

  HttpDio._internal();

  static final _singleton = HttpDio._internal();

  factory HttpDio() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000,
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (response.statusCode != null) {
        debugPrint(response.statusCode.toString());
      }

      return handler.next(response);
    }, onError: (DioError e, handler) async {
      if (e.response != null && e.response!.statusCode != null) {
        // if(navigatorKey.currentState != null) {
        //
        // }
        debugPrint(
            "Dio Error ${e.toString()} with status code ${e.response!.statusCode}");
      } else {
        return handler.next(e);
      }
    }));

    return dio;
  }
}
