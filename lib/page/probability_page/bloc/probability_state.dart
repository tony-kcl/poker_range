part of 'probability_bloc.dart';

class ProbabilityState extends Equatable {
  const ProbabilityState({
    this.potSize,
    this.records = const [],
    this.isModifying = false,
    this.flopToRiver = '',
    this.flopToTurn = '',
    this.turnToRiver = '',
  });

  final double? potSize;

  final List<ProbabilityRecord> records;

  final bool isModifying;

  final String? flopToRiver;
  final String? flopToTurn;
  final String? turnToRiver;

  ProbabilityState copyWith({
    Wrapped<double?>? potSize,
    List<ProbabilityRecord>? records,
    bool? isModifying,
    String? flopToRiver,
    String? flopToTurn,
    String? turnToRiver,
  }) {
    return ProbabilityState(
      potSize: potSize != null ? potSize.value : this.potSize,
      records: records ?? this.records,
      isModifying: isModifying ?? this.isModifying,
      flopToRiver: flopToRiver ?? this.flopToRiver,
      flopToTurn: flopToTurn ?? this.flopToTurn,
      turnToRiver: turnToRiver ?? this.turnToRiver,
    );
  }
  
  @override
  List<Object?> get props => [ 
    potSize, records, isModifying,
    flopToRiver, flopToTurn, turnToRiver
  ];
}