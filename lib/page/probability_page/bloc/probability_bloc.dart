import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/constant/constant.dart';
import 'package:poker_range/model/probability_record.dart';
import 'package:poker_range/model/wrapped.dart';

part 'probability_state.dart';
part 'probability_event.dart';

class ProbabilityBloc extends Bloc<ProbabilityEvent, ProbabilityState> {
  ProbabilityBloc() : super(const ProbabilityState()) {
    on<ProbabilitySetPotEvent>(_setPotSize);
    on<ProbabilitySetupRecordsEvent>(_setupRecords);
    on<ProbabilitySwapIndexEvent>(_swapIndex);
    on<ProbabilityAddRecordEvent>(_addRecord);
  }

  void _setupRecords(ProbabilitySetupRecordsEvent event, Emitter<ProbabilityState> emit) {
    emit(state.copyWith(records: event.records ?? Constant.defaultRecords));
  }

  void _setPotSize(ProbabilitySetPotEvent event, Emitter<ProbabilityState> emit) {
    emit(state.copyWith(potSize: Wrapped.value(event.potSize)));
  }

  void _swapIndex(ProbabilitySwapIndexEvent event, Emitter<ProbabilityState> emit) {
    final oldItem = state.records[event.oldIndex];
    final newIndex = event.oldIndex < event.newIndex ? event.newIndex - 1 : event.newIndex;
    final newRecords = [...state.records];

    newRecords.removeAt(event.oldIndex);
    newRecords.insert(newIndex, oldItem);
    emit(state.copyWith(records: newRecords));
  }

  void _addRecord(ProbabilityAddRecordEvent event, Emitter<ProbabilityState> emit) {
    final newRecords = [event.record, ...state.records];
    emit(state.copyWith(records: newRecords));
  }
}