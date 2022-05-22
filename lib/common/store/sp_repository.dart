import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository{
  Future getAll(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }


  Future save(String key, item) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, item);
  }

  Future remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
