import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/constant/constant.dart';
import 'package:poker_range/constant/field.dart';
import 'package:poker_range/helper/shared_preference/shared_preference_helper.dart';
import 'package:poker_range/model/probability_record.dart';
import 'package:poker_range/model/wrapped.dart';
import 'package:poker_range/service/probability_record_service.dart';

part 'probability_state.dart';
part 'probability_event.dart';

class ProbabilityBloc extends Bloc<ProbabilityEvent, ProbabilityState> {
  ProbabilityBloc(this._dataService) : super(const ProbabilityState()) {
    on<ProbabilitySetPotEvent>(_setPotSize);
    on<ProbabilitySetupRecordsEvent>(_setupRecords);
    on<ProbabilitySwapIndexEvent>(_swapIndex);
    on<ProbabilityAddRecordEvent>(_addRecord);
    on<ProbabilityToggleModifyEvent>(_toggleModify);
    on<ProbabilityRemoveRecordEvent>(_removeRecord);
  }

  final ProbabilityRecordService _dataService;

  void _setupRecords(ProbabilitySetupRecordsEvent event, Emitter<ProbabilityState> emit) {
    final records = _dataService.loadRecords();
    if (records.isEmpty) {
      _dataService.saveRecords(Constant.defaultRecords);
    }
    emit(
      state.copyWith(
        records: records.isNotEmpty ? records : Constant.defaultRecords,
        flopToRiver: SharedPreferencesHelper().getString(Field.flopToRiverField),
        flopToTurn: SharedPreferencesHelper().getString(Field.flopToTurnField),
        turnToRiver: SharedPreferencesHelper().getString(Field.turnToRiverField),
      )
    );
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
    _dataService.saveRecords(newRecords);
    emit(state.copyWith(records: newRecords));
  }

  void _addRecord(ProbabilityAddRecordEvent event, Emitter<ProbabilityState> emit) {
    final newRecords = [event.record, ...state.records];
    _dataService.saveRecords(newRecords);
    emit(state.copyWith(records: newRecords));
  }

  void _toggleModify(ProbabilityToggleModifyEvent event, Emitter<ProbabilityState> emit) {
    emit(state.copyWith(isModifying: event.toggle));
  }

  void _removeRecord(ProbabilityRemoveRecordEvent event, Emitter<ProbabilityState> emit) {
    final newRecords = [...state.records];
    newRecords.removeAt(event.index);
    _dataService.saveRecords(newRecords);
    emit(state.copyWith(records: newRecords));
  }
}