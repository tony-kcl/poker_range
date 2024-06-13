import 'package:flutter/material.dart';
import 'package:poker_range/helper/winRate/win_rate_calculator.dart';
import 'package:poker_range/model/probability_record.dart';

class Constant {
  static const Color defaultThemeColor = Colors.blue;

  static List<String> defaultNoteRecords = [
    '錦標賽買入後根據抽到卡片的位置入座, 座位從荷官的順時鐘方向為1開始遞增',
    '面額大的籌碼需放在外面讓別人看得到',
    '手牌進行時不可與他人討論',
    '下注時籌碼必須一次性投入, 或是先講數字再投入(不可分段放入)',
    '放一個籌碼代表跟注(除非有特別說Raise或是All in等字眼)',
    '錦標賽All in所有人都必須亮牌',
    '最小加注為大於等於前一個人的加注量,(大盲為2, 前一個人Raise到5, 此時最小加注為 8 => 5 + (5 - 2) = 8,)',
    '如果河牌亮牌階段對手蓋著棄牌, 則不需秀出手牌即可收池',
    '不可以越位棄牌, 下注等行為',
    '錦標賽不可去碰底池的籌碼, 只能請荷官撥動底池來讓你計算底池大小'
  ];

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
      title: '8 Outs',
      winRate: WinRateCalculator.calculateByOuts(8),
    ),
    ProbabilityRecord(
      title: '7 Outs',
      winRate: WinRateCalculator.calculateByOuts(7),
    ),
    ProbabilityRecord(
      title: '6 Outs',
      winRate: WinRateCalculator.calculateByOuts(6),
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