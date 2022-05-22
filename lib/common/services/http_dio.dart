import 'package:dio/dio.dart';
import 'package:stocio_app/common/jwt/jwt_utils.dart';
import 'package:stocio_app/main.dart';

class HttpDio {

  static const baseUrl = 'https://stocio-backend.vercel.app';

  Dio? _dio;
  HttpDio() {

    // Dio with a BaseOptions instance.
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 10000,
      connectTimeout: 10000,
      sendTimeout: 10000,
      validateStatus: (status) {
        return status! < 401;
      },
      followRedirects: false
    ));

    _dio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); //continue
    }, onError: (DioError e, handler) async {

      if (e.response != null &&
          e.response!.statusCode != null &&
          e.response!.statusCode == 401) {
        if (navigatorKey.currentState != null) {
          await JwtUtils.sharedPreferencesRepository.remove("at");
          await JwtUtils.sharedPreferencesRepository.remove("rt");
          navigatorKey.currentState!.pushReplacementNamed("/login");
        }
      } else {
        return handler.next(e); //continue
      }
    }));

  }

  Dio get dio {
    return _dio!;
  }
}
