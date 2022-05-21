import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:stocio_app/common/jwt/jwt_model.dart';
import 'package:stocio_app/common/store/sp_repository.dart';

class JwtUtils {
  static SharedPreferencesRepository sharedPreferencesRepository = SharedPreferencesRepository();

  static Future<JwtModel> decode() async {
    String at = (await sharedPreferencesRepository.getAll("at")) as String;
    Map<String, dynamic> decodedToken = JwtDecoder.decode(at);

    String userId = decodedToken["userId"] as String;
    String email = decodedToken["email"] as String;
    String instituteRef = decodedToken["instituteRef"] as String;

    return JwtModel(userId: userId, email: email, at: at, instituteRef: instituteRef);
  }
}