import 'dart:ui';

import 'package:poker_range/constant/constant.dart';
import 'package:poker_range/constant/field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  ThemeRepository(this._preferences);

  final SharedPreferences _preferences;

  Brightness getBrightness() {
    final isLight = _preferences.getBool(Field.brightnessField);
    if (isLight ?? true) {
      return Brightness.light;
    } else {
      return Brightness.dark;
    }
  }

  Future<bool> setBrightness(Brightness brightness) {
    return _preferences.setBool(Field.brightnessField, brightness == Brightness.light);
  }

  Color getThemeColor() {
    final colorInt = _preferences.getInt(Field.themeColorField);
    if (colorInt != null) {
      return Color(colorInt);
    }
    return Constant.defaultThemeColor;
  }

  Future<bool> setThemeColor(Color color) {
    return _preferences.setInt(Field.themeColorField, color.value);
  }
}