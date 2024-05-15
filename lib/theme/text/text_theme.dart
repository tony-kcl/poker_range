import 'package:flutter/material.dart';

class BaseTextTheme {
  const BaseTextTheme._();

  static const _fontFamily = 'open_sans';

  static const double _fontSizeH1 = 48;
  static const double _fontSizeH2 = 32;
  static const double _fontSizeH3 = 28;
  static const double _fontSizeH4 = 24;
  static const double _fontSizeH5 = 20;
  static const double _fontSizeH6 = 18;
  static const double _fontSizeTitle = 16;
  static const double _fontSizeSubtitle = 14;
  static const double _fontSizeBody1 = 16;
  static const double _fontSizeBody2 = 14;
  static const double _fontSizeCaption1 = 12;
  static const double _fontSizeCaption2 = 12;
  static const double _fontSizeTiny1 = 10;
  static const double _fontSizeTiny2 = 10;

  static const double _lineHeight = 1.4;

  static const h1 = TextStyle(
    fontSize: _fontSizeH1,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const h2 = TextStyle(
    fontSize: _fontSizeH2,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const h3 = TextStyle(
    fontSize: _fontSizeH3,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const h4 = TextStyle(
    fontSize: _fontSizeH4,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const h5 = TextStyle(
    fontSize: _fontSizeH5,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const h6 = TextStyle(
    fontSize: _fontSizeH6,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const title = TextStyle(
    fontSize: _fontSizeTitle,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const subtitle = TextStyle(
    fontSize: _fontSizeSubtitle,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const body1 = TextStyle(
    fontSize: _fontSizeBody1,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const body2 = TextStyle(
    fontSize: _fontSizeBody2,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const caption1 = TextStyle(
    fontSize: _fontSizeCaption1,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const caption2 = TextStyle(
    fontSize: _fontSizeCaption2,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const tiny1 = TextStyle(
    fontSize: _fontSizeTiny1,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static const tiny2 = TextStyle(
    fontSize: _fontSizeTiny2,
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  // region 設計稿上 styles 對應不到 Flutter 2021 Spec
  static TextStyle get headlineLarge => const TextStyle(
    fontSize: (_fontSizeH3 + _fontSizeH4) / 2,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );

  static TextStyle get labelLarge => const TextStyle(
    fontSize: (_fontSizeCaption1 + _fontSizeTiny1) / 2,
    fontWeight: FontWeight.w700,
    fontFamily: _fontFamily,
    height: _lineHeight,
  );
  // endregion
}

extension TextThemeX on TextTheme {
  TextStyle get h1 => displayLarge ?? BaseTextTheme.h1;
  TextStyle get h2 => displayMedium ?? BaseTextTheme.h2;
  TextStyle get h3 => displaySmall ?? BaseTextTheme.h3;
  TextStyle get h4 => headlineMedium ?? BaseTextTheme.h4;
  TextStyle get h5 => headlineSmall ?? BaseTextTheme.h5;
  TextStyle get h6 => titleLarge ?? BaseTextTheme.h6;
  TextStyle get title => titleMedium ?? BaseTextTheme.title;
  TextStyle get subtitle => titleSmall ?? BaseTextTheme.subtitle;
  TextStyle get body1 => bodyLarge ?? BaseTextTheme.body1;
  TextStyle get body2 => bodyMedium ?? BaseTextTheme.body2;
  TextStyle get caption1 => bodySmall ?? BaseTextTheme.caption1;
  TextStyle get caption2 => BaseTextTheme.caption2;
  TextStyle get tiny1 => labelMedium ?? BaseTextTheme.tiny1;
  TextStyle get tiny2 => labelSmall ?? BaseTextTheme.tiny2;
}