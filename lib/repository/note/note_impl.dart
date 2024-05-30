import 'package:poker_range/constant/field.dart';
import 'package:poker_range/service/note_record_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteSharedPreferenceImpl extends NoteRecordService {
  NoteSharedPreferenceImpl(this._prefs);

  final SharedPreferences _prefs;
  
  @override
  List<String> loadRecords() {
    final List<String> records = [];
    final json = _prefs.getStringList(Field.noteRecordField);
    if (json != null) {
      records.addAll(json);
    }

    return records;
  }

  @override
  Future<bool> saveRecords(List<String> records) {
    return _prefs.setStringList(Field.noteRecordField, records);
  }
}