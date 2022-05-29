import 'package:dio/dio.dart';
import 'package:stocio_app/common/jwt/jwt_utils.dart';
import 'package:stocio_app/main.dart';

class HttpDio {

  static const baseUrl = 'https://stocio-backend.vercel.app';
  static const testUrl ='https://stocio-backend-git-test-hemantlakhotia204.vercel.app';

  Dio? _dio;
  HttpDio() {

    // Dio with a BaseOptions instance.
    _dio = Dio(BaseOptions(
      baseUrl: testUrl,
      receiveTimeout: 15000,
      connectTimeout: 15000,
      sendTimeout: 15000,
      validateStatus: (status) {
        return status! < 500;
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
