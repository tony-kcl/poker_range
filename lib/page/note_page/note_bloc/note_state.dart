part of 'note_bloc.dart';

class NoteState extends Equatable {
  const NoteState({
    this.isModifying = false,
    this.noteRecords = const [],
  });

  final bool isModifying;

  final List<String> noteRecords;

  NoteState copyWith({
    bool? isModifying,
    List<String>? noteRecords,
  }) {
    return NoteState(
      isModifying: isModifying ?? this.isModifying,
      noteRecords: noteRecords ?? this.noteRecords,
    );
  }


  @override
  List<Object?> get props => [
    isModifying,
  ];
}