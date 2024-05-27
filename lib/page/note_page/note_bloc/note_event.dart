part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {}

class NoteToggleModifyEvent extends NoteEvent {
  NoteToggleModifyEvent(this.isModifying);

  final bool isModifying;
  
  @override
  List<Object?> get props => [ isModifying ];
}