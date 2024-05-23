import 'package:poker_range/model/probability_record.dart';

abstract class ProbabilityRecordService {
  Future<bool> saveRecords(List<ProbabilityRecord> records);

  List<ProbabilityRecord> loadRecords();
}