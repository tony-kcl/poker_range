import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/theme/theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(BaseTheme.createThemeData());

  changeTheme(Color seedColor) {
    emit(BaseTheme.createThemeData().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
    ));
  }
}