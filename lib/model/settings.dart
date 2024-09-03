class Settings {
  Settings({
    required this.normalRecord,
    required this.gameRule,
    required this.handRanking,
    required this.onSiteNote,
  });

  /// 顯示 常見機率
  final bool normalRecord;

  /// 顯示 遊戲規則
  final bool gameRule;

  /// 顯示 牌型大小
  final bool handRanking;

  /// 顯示 現場注意事項
  final bool onSiteNote;

  Settings copyWith({
    bool? normalRecord,
    bool? gameRule,
    bool? handRanking,
    bool? onSiteNote,
  }) {
    return Settings(
      normalRecord: normalRecord ?? this.normalRecord,
      gameRule: gameRule ?? this.gameRule,
      handRanking: handRanking ?? this.handRanking,
      onSiteNote: onSiteNote ?? this.onSiteNote,
    );
  }

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      normalRecord: json['normalRecord'] ?? true,
      gameRule: json['gameRule'] ?? true,
      handRanking: json['handRanking'] ?? true,
      onSiteNote: json['onSiteNote'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'normalRecord': normalRecord,
      'gameRule': gameRule,
      'handRanking': handRanking,
      'onSiteNote': onSiteNote,
    };
  }
}