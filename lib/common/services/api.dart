import 'package:dio/dio.dart';

class Api {
  final Dio dio = createDio();

  static const baseUrl = 'https://stocio-backend.vercel.app';

  // final tokenDio = Dio(BaseOptions(baseUrl: baseUrl));

  Api._internal();
  static final _singleton = Api._internal();
  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000,
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    return dio;
  }

}