import 'package:poker_range/model/probability_record.dart';
import 'package:poker_range/service/probability_record_service.dart';

class ProbabilityRepository {
  final ProbabilityRecordService _service;

  ProbabilityRepository(this._service);

  Future<bool> saveRecords(List<ProbabilityRecord> records) => _service.saveRecords(records);

  List<ProbabilityRecord> loadRecords() => _service.loadRecords();
}