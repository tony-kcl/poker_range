import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static final SharedPreferencesHelper _singleton = SharedPreferencesHelper._internal();

  SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper() {
    return _singleton;
  }

  late SharedPreferences pref;

  void ensureInitialized(SharedPreferences pref) {
    this.pref = pref;
  }

  String? getString(String field) {
    return pref.getString(field);
  }

  Future<bool> setString({required String field, required String value}) {
    return pref.setString(field, value);
  }
}