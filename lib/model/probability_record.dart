import 'package:poker_range/model/win_rate.dart';

class ProbabilityRecord {
  ProbabilityRecord({
    required this.title,
    required this.winRate,
  });

  final String title;
  final WinRate winRate;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'winRate': winRate.toJson(),
    };
  }

  factory ProbabilityRecord.fromJson(Map<String, dynamic> json) {
    return ProbabilityRecord(
      title: json['title'],
      winRate: WinRate.fromJson(json['winRate']),
    );
  }
}