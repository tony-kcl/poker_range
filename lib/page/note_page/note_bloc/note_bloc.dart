import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/constant/constant.dart';
import 'package:poker_range/service/note_record_service.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc(this._recordService) : super(const NoteState()) {
    on<NoteLoadRecordEvent>(_loadRecord);
    on<NoteChangeIndexEvent>(_changeIndex);
    on<NoteRemoveRecordEvent>(_removeRecord);
    on<NoteAddRecordEvent>(_addNote);
    on<NoteToggleModifyEvent>(_toggleModify);
  }

  final NoteRecordService _recordService;

  void _loadRecord(NoteLoadRecordEvent event, Emitter<NoteState> emit) {
    final records = _recordService.loadRecords();
    if (records.isEmpty) {
      _recordService.saveRecords(Constant.defaultNoteRecords);
    }
    emit(state.copyWith(noteRecords: records.isNotEmpty ? records : Constant.defaultNoteRecords));
  }

  void _changeIndex(NoteChangeIndexEvent event, Emitter<NoteState> emit) {
    final oldItem = state.noteRecords[event.oldIndex];
    final newIndex = event.oldIndex < event.newIndex ? event.newIndex - 1 : event.newIndex;
    final newRecords = [...state.noteRecords];

    newRecords.removeAt(event.oldIndex);
    newRecords.insert(newIndex, oldItem);
    _recordService.saveRecords(newRecords);
    emit(state.copyWith(noteRecords: newRecords));
  }

  void _removeRecord(NoteRemoveRecordEvent event, Emitter<NoteState> emit) {
    final newRecords = [...state.noteRecords];
    newRecords.removeAt(event.index);
    _recordService.saveRecords(newRecords);
    emit(state.copyWith(noteRecords: newRecords));
  }

  void _addNote(NoteAddRecordEvent event, Emitter<NoteState> emit) {
    final newRecords = [event.title, ...state.noteRecords];
    _recordService.saveRecords(newRecords);
    emit(state.copyWith(noteRecords: newRecords));
  }

  void _toggleModify(NoteToggleModifyEvent event, Emitter<NoteState> emit) {
    emit(state.copyWith(isModifying: event.isModifying));
  }
}