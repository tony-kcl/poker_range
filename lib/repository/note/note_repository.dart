import 'package:poker_range/service/note_record_service.dart';

class NoteRepository {
  NoteRepository(this._service);

  final NoteRecordService _service;

  Future<bool> saveRecords(List<String> records) => _service.saveRecords(records);

  List<String> loadRecords() => _service.loadRecords();
}