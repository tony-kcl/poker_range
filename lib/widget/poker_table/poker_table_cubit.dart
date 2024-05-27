import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/widget/poker_table/poker_table.dart';

class PokerTableCubit extends Cubit<ShowType> {
  PokerTableCubit(ShowType type) : super(type);

  void changeType(ShowType type) {
    emit(type);
  }
}