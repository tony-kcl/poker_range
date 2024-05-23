import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/model/themes/my_custom_color.dart';
import 'package:poker_range/model/themes/my_theme_data.dart';
import 'package:poker_range/repository/theme/theme_repository.dart';
import 'package:poker_range/theme/theme.dart';
import 'package:poker_range/utils/material/color.dart';
import 'package:poker_range/utils/material/theme_generate.dart';

class ThemeCubit extends Cubit<MyThemeData> {
  ThemeCubit(this._repo) : super(MyThemeData(themeData: _buildThemes(primaryColor: _repo.getThemeColor()).getTheme(_repo.getBrightness()), seedColor: _repo.getThemeColor()));

  final ThemeRepository _repo;

  changeTheme({Color? seedColor, Brightness? brightness}) {
    final theme = _buildThemes(primaryColor: seedColor ?? state.seedColor).getTheme(brightness ?? state.themeData.brightness);
    emit(
      MyThemeData(
        themeData: theme,
        seedColor: seedColor ?? state.seedColor
      )
    );
    if (brightness != null) {
      _repo.setBrightness(brightness);
    }
    if (seedColor != null) {
      _repo.setThemeColor(seedColor);
    }
  }

  static MyDemoThemeData _buildThemes({
    required Color primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
    List<MyCustomColor>? customColors,
  }) {
    return custom_generateCustomTheme(
      customColors: customColors ?? [],
      primary: hexFromArgb(primaryColor.value),
      secondary: secondaryColor == null ? null : hexFromArgb(secondaryColor.value),
      tertiary: tertiaryColor == null ? null : hexFromArgb(tertiaryColor.value),
      neutral: neutralColor == null ? null : hexFromArgb(neutralColor.value),
    );
  }
}