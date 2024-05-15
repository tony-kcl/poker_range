import 'package:poker_range/model/position_range.dart';

class PeopleRangeTable {
  PeopleRangeTable({
    required this.peopleCount,
    required this.ranges,
    // this.bbRange,
    // this.btnRange,
    // this.coRange,
    // this.hjRange,
    // this.mp1range,
    // this.mp2range,
    // this.sbRange,
    // this.utgP1Range,
    // this.utgP2Range,
    // this.utgRange,
  });

  /// 順序為 BB -> SB -> Btn -> ... -> UTG
  final List<PositionRange> ranges;

  /// 人數
  final int peopleCount;

  // final PositionRange? utgRange;
  // final PositionRange? utgP1Range;
  // final PositionRange? utgP2Range;
  // final PositionRange? mp1range;
  // final PositionRange? mp2range;
  // final PositionRange? hjRange;
  // final PositionRange? coRange;
  // final PositionRange? btnRange;
  // final PositionRange? sbRange;
  // final PositionRange? bbRange;
}