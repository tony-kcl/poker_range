class WinRate {
  WinRate({
    required this.flopToTurn,
    required this.flopToRiver,
    required this.turnToRiver,
  });
  
  final double flopToRiver;
  final double flopToTurn;
  final double turnToRiver;

  Map<String, dynamic> toJson() {
    return {
      'flopToRiver': flopToRiver,
      'flopToTurn': flopToTurn,
      'turnToRiver': turnToRiver,
    };
  }

  factory WinRate.fromJson(Map<String, dynamic> json) {
    return WinRate(
      flopToRiver: json['flopToRiver'],
      flopToTurn: json['flopToTurn'],
      turnToRiver: json['turnToRiver'],
    );
  }
}