import 'package:flutter/material.dart';
import 'package:poker_range/theme/text/text_theme.dart';

class BaseTheme {
  BaseTheme._();

  static ThemeData createThemeData() {
    return ThemeData(
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