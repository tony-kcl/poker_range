import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/theme/theme.dart';

class ThemeCubit extends Cubit<MyThemeData> {
  ThemeCubit(Color seedColor) : super(MyThemeData(themeData: BaseTheme.createThemeData(seedColor, brightness: Brightness.light), seedColor: seedColor,));

  changeTheme({Color? seedColor, bool? isBrightness}) {
    emit(
      MyThemeData(
        themeData: BaseTheme.createThemeData(
          seedColor ?? state.seedColor,
          brightness: isBrightness != null ? isBrightness ? Brightness.light : Brightness.dark : state.themeData.brightness,
        ), 
        seedColor: seedColor ?? state.seedColor,
      )
    );
  }
}