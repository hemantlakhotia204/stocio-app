import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/services/api.dart';

class InstituteService {
  InstituteService._internal();

  static final InstituteService _singleton = InstituteService._internal();
  static final httpDio = Api();


  factory InstituteService() {
    return _singleton;
  }

  Future<SResponse> getInstitutes() async {

    final response = await httpDio.dio.get('/api/institute');

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
