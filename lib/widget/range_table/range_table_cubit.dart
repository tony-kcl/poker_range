import 'package:flutter_bloc/flutter_bloc.dart';

class RangeTableCubit extends Cubit<int> {
  RangeTableCubit() : super(0);

  setSelectedIndex(int index) {
    emit(index);
  }
}