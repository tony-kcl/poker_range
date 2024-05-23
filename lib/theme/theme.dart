import 'package:flutter/material.dart';
import 'package:poker_range/theme/text/text_theme.dart';

class MyThemeData {
  MyThemeData({
    required this.themeData,
    required this.seedColor,
  });

  final ThemeData themeData;
  final Color seedColor;

  MyThemeData copyWith({
    ThemeData? themeData,
    Color? seedColor,
  }) {
    return MyThemeData(
      seedColor: seedColor ?? this.seedColor,
      themeData: themeData ?? this.themeData,
    );
  }
}

class BaseTheme {
  BaseTheme._();

  static ThemeData createThemeData(Color seedColor, {Brightness? brightness}) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness ?? Brightness.light),
      textTheme: TextTheme(
        displayLarge: BaseTextTheme.h1,
        displayMedium: BaseTextTheme.h2,
        displaySmall: BaseTextTheme.h3,
        headlineLarge: (BaseTextTheme.headlineLarge),
        headlineMedium: (BaseTextTheme.h4),
        headlineSmall: (BaseTextTheme.h5),
        titleLarge: (BaseTextTheme.h6),
        titleMedium: (BaseTextTheme.title),
        titleSmall: (BaseTextTheme.subtitle),
        bodyLarge: (BaseTextTheme.body1),
        bodyMedium: (BaseTextTheme.body2),
        bodySmall: (BaseTextTheme.caption1),
        labelLarge: (BaseTextTheme.labelLarge),
        labelMedium: (BaseTextTheme.tiny1),
        labelSmall: (BaseTextTheme.tiny2),
      )
    );
  }
}