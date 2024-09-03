import 'package:poker_range/model/settings.dart';
import 'package:poker_range/service/setting_service.dart';

class SettingsRepository {
  final SettingService _service;

  SettingsRepository(this._service);

  Future<bool> saveSettings(Settings settings) => _service.saveSettings(settings);

  Settings loadSettings() => _service.loadSettings();
}