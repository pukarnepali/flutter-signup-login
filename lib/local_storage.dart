import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future saveData(bool isLogin) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('isLogin', isLogin);
  }

  Future saveUser(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  Future<bool> getData() async {
    final SharedPreferences prefs = await _prefs;
    var response = prefs.getBool('isLogin') ?? false;
    return response;
  }

  Future<String> getUser(String key) async {
    final SharedPreferences prefs = await _prefs;
    var response = prefs.getString(key) ?? "";
    return response;
  }
}
