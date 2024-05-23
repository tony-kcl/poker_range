import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static final SharedPreferencesHelper _singleton = SharedPreferencesHelper._internal();

  SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper() {
    return _singleton;
  }

  late SharedPreferences _pref;

  void ensureInitialized(SharedPreferences pref) {
    _pref = pref;
  }

  String? getString(String field) {
    return _pref.getString(field);
  }

  Future<bool> setString({required String field, required String value}) {
    return _pref.setString(field, value);
  }
}