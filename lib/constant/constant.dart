import 'package:flutter/material.dart';
import 'package:poker_range/helper/winRate/win_rate_calculator.dart';
import 'package:poker_range/model/probability_record.dart';

class Constant {
  static const Color defaultThemeColor = Colors.blue;

  static List<ProbabilityRecord> defaultRecords = [
    ProbabilityRecord(
      title: '買花',
      winRate: WinRateCalculator.calculateByOuts(9),
    ),
    ProbabilityRecord(
      title: '買兩頭順',
      winRate: WinRateCalculator.calculateByOuts(8),
    ),
    ProbabilityRecord(
      title: '5 Outs',
      winRate: WinRateCalculator.calculateByOuts(5),
    ),
    ProbabilityRecord(
      title: '4 Outs',
      winRate: WinRateCalculator.calculateByOuts(4),
    ),
    ProbabilityRecord(
      title: '3 Outs',
      winRate: WinRateCalculator.calculateByOuts(3),
    ),
    ProbabilityRecord(
      title: '2 Outs',
      winRate: WinRateCalculator.calculateByOuts(2),
    ),
    ProbabilityRecord(
      title: '1 Out',
      winRate: WinRateCalculator.calculateByOuts(1),
    ),
  ];
}