part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {}

class NoteToggleModifyEvent extends NoteEvent {
  NoteToggleModifyEvent(this.isModifying);

  final bool isModifying;
  
  @override
  List<Object?> get props => [ isModifying ];
}

class NoteLoadRecordEvent extends NoteEvent {
  @override
  List<Object?> get props => [];
}

class NoteChangeIndexEvent extends NoteEvent {
  NoteChangeIndexEvent({
    required this.oldIndex,
    required this.newIndex,
  });

  final int oldIndex;
  final int newIndex;

  @override
  List<Object?> get props => [ oldIndex, newIndex ];
}

class NoteRemoveRecordEvent extends NoteEvent {
  NoteRemoveRecordEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [ index ];
}

class NoteAddRecordEvent extends NoteEvent {
  NoteAddRecordEvent(this.title);
  
  final String title;

  @override
  List<Object?> get props => [ title ];
}