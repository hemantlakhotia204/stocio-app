import 'package:dio/dio.dart';
import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/models/user_model.dart';
import 'package:stocio_app/common/services/http_dio.dart';
import 'package:flutter/material.dart';

class RegisterService {
  RegisterService._internal();

  static final RegisterService _singleton = RegisterService._internal();
  static final httpDio = HttpDio();

  factory RegisterService() {
    return _singleton;
  }

  Future<SResponse> registerUser(UserModel data) async {
    debugPrint(data.toJson().toString());
    final response = await httpDio.dio.post(
      '/api/auth/register',
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json'
        },
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
