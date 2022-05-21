import 'package:dio/dio.dart';
import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/services/http_dio.dart';

class LoginService {
  LoginService._internal();

  static final LoginService _singleton = LoginService._internal();
  static final httpDio = HttpDio();


  factory LoginService() {
    return _singleton;
  }

  Future<SResponse> loginUser(String email, String password) async {

    var data = {
      "email": email,
      "password": password
    };

    final response = await httpDio.dio.post(
      '/api/auth/login',
      options: Options(
        headers: <String, String> {
          'Content-Type': 'application/json'
        }
      ),
      data: data
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