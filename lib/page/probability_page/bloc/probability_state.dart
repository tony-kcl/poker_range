part of 'probability_bloc.dart';

class ProbabilityState extends Equatable {
  const ProbabilityState({
    this.potSize,
    this.records = const [],
    this.isModifying = false,
  });

  final double? potSize;

  final List<ProbabilityRecord> records;

  final bool isModifying;

  ProbabilityState copyWith({
    Wrapped<double?>? potSize,
    List<ProbabilityRecord>? records,
    bool? isModifying,
  }) {
    return ProbabilityState(
      potSize: potSize != null ? potSize.value : this.potSize,
      records: records ?? this.records,
      isModifying: isModifying ?? this.isModifying,
    );
  }
  
  @override
  List<Object?> get props => [ potSize, records, isModifying ];
}