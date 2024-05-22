part of 'probability_bloc.dart';

class ProbabilityState extends Equatable {
  const ProbabilityState({
    this.potSize,
    this.records = const [],
  });

  final double? potSize;

  final List<ProbabilityRecord> records;

  ProbabilityState copyWith({
    Wrapped<double?>? potSize,
    List<ProbabilityRecord>? records,
    bool? isModifying,
  }) {
    return ProbabilityState(
      potSize: potSize != null ? potSize.value : this.potSize,
      records: records ?? this.records,
    );
  }
  
  @override
  List<Object?> get props => [ potSize, records ];
}