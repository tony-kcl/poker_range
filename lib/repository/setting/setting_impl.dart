import 'dart:convert';

import 'package:poker_range/constant/field.dart';
import 'package:poker_range/model/settings.dart';
import 'package:poker_range/service/setting_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingSharedPreferenceImpl extends SettingService {
  SettingSharedPreferenceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Settings loadSettings() {
    final json = _prefs.getString(Field.settingRecordField);
    if (json != null) {
      return Settings.fromJson(jsonDecode(json));
    } else {
      return Settings(normalRecord: true, gameRule: true, handRanking: true, onSiteNote: true);
    }
  }

  @override
  Future<bool> saveSettings(Settings settings) {
    return _prefs.setString(Field.settingRecordField, jsonEncode(settings.toJson()));
  }
}