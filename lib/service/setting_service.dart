import 'package:poker_range/model/settings.dart';

abstract class SettingService {
  Future<bool> saveSettings(Settings settings);

  Settings loadSettings();
}