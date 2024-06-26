import 'package:poker_range/extensions/extensions.dart';
import 'package:poker_range/model/themes/my_custom_color.dart';
import 'package:poker_range/model/themes/my_single_color_scheme.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as colorUtilities;

class MyCustomColorResult extends MyCustomColor {
  MyCustomColorResult({
    required super.name,
    required super.harmonized,
    required super.color,
    required this.light,
    required this.dark,
    required this.palette,
  });

  MySingleColorScheme light;
  MySingleColorScheme dark;
  colorUtilities.TonalPalette palette;

  @override
  Map toJson() => {
    'name': name,
    'harmonized': harmonized,
    'color': color,
    'light': light.toJson(),
    'dark': dark.toJson(),
    'palette': palette.xToJson(),
  };

  @override
  factory MyCustomColorResult.fromJson(Map data) {
    return MyCustomColorResult(
      name: data['name'],
      harmonized: data['harmonized'],
      color: data['color'],
      light: MySingleColorScheme.fromJson(data['light']),
      dark: MySingleColorScheme.fromJson(data['dark']),
      palette: toTonalPaletteFromJson(data['palette']),
    );
  }
}


