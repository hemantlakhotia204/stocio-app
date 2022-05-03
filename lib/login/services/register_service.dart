import 'package:dio/dio.dart';
import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/models/user_model.dart';
import 'package:stocio_app/common/services/api.dart';

class RegisterService {
  RegisterService._internal();

  static final RegisterService _singleton = RegisterService._internal();
  static final httpDio = Api();

  factory RegisterService() {
    return _singleton;
  }

  Future<SResponse> registerUser(UserModel data) async {
    final response = await httpDio.dio.post(
      '/api/',
      options: Options(
        headers: <String, String>{'Content-Type': 'application/json'},
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
