import 'dart:ui';

import 'package:poker_range/model/position.dart';

class PositionRange {
  PositionRange({
    required this.position,
    required this.range,
    required this.paintColor,
  });

  final Position position;

  /// 固定為 169 個
  final List<bool> range;

  final Color? paintColor;
}

// class UTGRange extends PositionRange {
//   UTGRange({required super.range});
// }

// class UTGp1Range extends PositionRange {
//   UTGp1Range({required super.range});
// }

// class UTGp2Range extends PositionRange {
//   UTGp2Range({required super.range});
// }

// class MP1Range extends PositionRange {
//   MP1Range({required super.range});
// }

// class MP2Range extends PositionRange {
//   MP2Range({required super.range});
// }

// class HJRange extends PositionRange {
//   HJRange({required super.range});
// }

// class CORange extends PositionRange {
//   CORange({required super.range});
// }

// class BTNRange extends PositionRange {
//   BTNRange({required super.range});
// }

// class SBRange extends PositionRange {
//   SBRange({required super.range});
// }

// class BBRange extends PositionRange {
//   BBRange({required super.range});
// }