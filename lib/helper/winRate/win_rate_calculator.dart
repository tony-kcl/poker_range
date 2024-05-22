import 'dart:math';

import 'package:poker_range/model/win_rate.dart';

class WinRateCalculator {
  static WinRate calculateByOuts(int outs) {
    return WinRate(
      flopToTurn: double.parse((outs / 47 * 100).toStringAsFixed(1)), 
      flopToRiver: double.parse(((1 - pow((47-outs)/47, 2)) * 100).toStringAsFixed(1)), 
      turnToRiver: double.parse((outs / 46 * 100).toStringAsFixed(1)),
    );
  }
}