import 'package:dio/dio.dart';
import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/services/http_dio.dart';

class OtpService {
  OtpService._internal();

  static final OtpService _singleton = OtpService._internal();
  static final httpDio = HttpDio();

  factory OtpService() {
    return _singleton;
  }

  Future<SResponse> verifyOtp(String otp) async {
    final response = await httpDio.dio.post(
      '/api/auth/verifyAccount',
      options: Options(
        headers: <String, String>{'Content-type': 'application/json'},
      ),
      data: otp,
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return SResponse.fromJson(response.data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      final res = SResponse.fromJson(response.data);
      throw Exception(res);
    }
  }

  Future<SResponse> resendOtp(String email) async {
    final response = await httpDio.dio.get(
      '/api/auth/register',
      queryParameters: <String, String>{'email': email},
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return SResponse.fromJson(response.data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      final res = SResponse.fromJson(response.data);
      throw Exception(res);
    }
  }
}
