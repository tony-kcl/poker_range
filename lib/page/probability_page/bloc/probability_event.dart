part of 'probability_bloc.dart';

sealed class ProbabilityEvent extends Equatable {}

class ProbabilitySetPotEvent extends ProbabilityEvent {
  ProbabilitySetPotEvent(this.potSize);

  final double? potSize;

  @override
  List<Object?> get props => [ potSize ];
}

class ProbabilitySetupRecordsEvent extends ProbabilityEvent {
  ProbabilitySetupRecordsEvent();

  @override
  List<Object?> get props => [ ];
}

class ProbabilitySwapIndexEvent extends ProbabilityEvent {
  ProbabilitySwapIndexEvent({
    required this.oldIndex,
    required this.newIndex,
  });

  final int oldIndex;
  final int newIndex;

  @override
  List<Object?> get props => [ oldIndex, newIndex ];
}

class ProbabilityAddRecordEvent extends ProbabilityEvent {
  ProbabilityAddRecordEvent(this.record);

  final ProbabilityRecord record;

  @override
  List<Object?> get props => [ record ];
}

class ProbabilityToggleModifyEvent extends ProbabilityEvent {
  ProbabilityToggleModifyEvent(this.toggle);

  final bool toggle;

  @override
  List<Object?> get props => [ toggle ];
}

class ProbabilityRemoveRecordEvent extends ProbabilityEvent {
  ProbabilityRemoveRecordEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [ index ];
}