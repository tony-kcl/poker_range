abstract class NoteRecordService {
  Future<bool> saveRecords(List<String> records);

  List<String> loadRecords();
}