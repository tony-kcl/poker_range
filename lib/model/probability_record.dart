import 'package:poker_range/model/win_rate.dart';

class ProbabilityRecord {
  ProbabilityRecord({
    required this.title,
    required this.winRate,
  });

  final String title;
  final WinRate winRate;
}