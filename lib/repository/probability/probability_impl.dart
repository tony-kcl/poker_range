import 'dart:convert';

import 'package:poker_range/constant/field.dart';
import 'package:poker_range/model/probability_record.dart';
import 'package:poker_range/service/probability_record_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProbabilitySharedPreferenceImpl extends ProbabilityRecordService {
  ProbabilitySharedPreferenceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<bool> saveRecords(List<ProbabilityRecord> records) {
    final List<String> data = [];

    for (var record in records) {
      data.add(jsonEncode(record.toJson()));
    }

    return _prefs.setStringList(Field.probabilityRecordField, data);
  }
  
  @override
  List<ProbabilityRecord> loadRecords() {
    final List<ProbabilityRecord> records = [];
    final json = _prefs.getStringList(Field.probabilityRecordField);
    if (json != null) {
      for (var data in json) {
        records.add(ProbabilityRecord.fromJson(jsonDecode(data) as Map<String, dynamic>));
      }
    }

    return records;
  }
}