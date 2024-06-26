import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:poker_range/enums/enums.dart';
import 'package:poker_range/model/models.dart';

class MyDemoThemeData {
  MyDemoThemeData({
    required this.seed,
    required this.baseline,
    required this.extendedColors,
    required this.coreColors,
    required this.lightScheme,
    required this.darkScheme,
    this.androidSchemes,
    required this.palettes,
    this.customColors = const [],
  });

  String seed;
  bool baseline;
  List<MyCustomColor> extendedColors;
  Map<MyColorSchemeKey, String?> coreColors;
  MyScheme lightScheme;
  MyScheme darkScheme;
  Map? androidSchemes;
  MyCorePalette palettes;
  List<MyCustomColorResult> customColors;

  Map toJson() {
    final jsonCoreColors = <String, String?>{};
    coreColors.forEach((key, value) {
      jsonCoreColors[key.code] = value;
    });

    return {
      'seed': seed,
      'baseline': baseline,
      'extendedColors': extendedColors.map((e) => e.toJson()).toList(),
      'coreColors': jsonCoreColors,
      'lightScheme': lightScheme.toJson(),
      'darkScheme': darkScheme.toJson(),
      'androidSchemes': androidSchemes,
      'palettes': palettes.toJson(),
      'customColors': customColors.map((e) => e.toJson()).toList(),
    };
  }

  factory MyDemoThemeData.fromJson(Map data) {
    return MyDemoThemeData(
      seed: data['seed'],
      baseline: data['baseline'],
      extendedColors: (data['extendedColors'] as List).map((e) => MyCustomColor.fromJson(e)).toList(),
      coreColors: _coreColorsFromJson(data['coreColors']),
      lightScheme: MyScheme.fromJson(data['lightScheme']),
      darkScheme: MyScheme.fromJson(data['darkScheme']),
      // androidSchemes: data['androidSchemes'],
      palettes: MyCorePalette.fromJson(data['palettes']),
      customColors: data['customColors'] == null ? [] : (data['customColors'] as List).map((e) => MyCustomColorResult.fromJson(e)).toList(),
    );
  }

  static Map<MyColorSchemeKey, String?> _coreColorsFromJson(Map data) {
    final res = <MyColorSchemeKey, String?>{};
    data.entries.forEach((e) {
      if (e.key is String && e.value is String?) {
        final xxx = MyColorSchemeKey.values.firstWhereOrNull(
              (yyy) => yyy.code == e.key,
        );
        if (xxx != null) {
          res[xxx] = e.value;
        }
      }
    });
    return res;
  }

  MyDemoThemeData copyWith({
    String? seed,
    bool? baseline,
    List<MyCustomColor>? extendedColors,
    Map<MyColorSchemeKey, String?>? coreColors,
    MyScheme? lightScheme,
    MyScheme? darkScheme,
    Map? androidSchemes,
    MyCorePalette? palettes,
    List<MyCustomColorResult>? customColors,
  }) {
    return MyDemoThemeData(
      seed: seed ?? this.seed,
      baseline: baseline ?? this.baseline,
      extendedColors: extendedColors ?? this.extendedColors,
      coreColors: coreColors ?? this.coreColors,
      lightScheme: lightScheme ?? this.lightScheme,
      darkScheme: darkScheme ?? this.darkScheme,
      androidSchemes: androidSchemes ?? this.androidSchemes,
      palettes: palettes ?? this.palettes,
      customColors: customColors ?? this.customColors,
    );
  }

  ThemeData getTheme(Brightness brightness) {
    return brightness == Brightness.light 
      ? ThemeData.from(
        useMaterial3: true,
        colorScheme: lightScheme.toColorScheme(),
        textTheme: ThemeData.light().textTheme,
      )
      : ThemeData.from(
        useMaterial3: true,
        colorScheme: darkScheme.toColorScheme(),
        textTheme: ThemeData.dark().textTheme,
      );
  }

}