enum Position {
  UTG,
  UTGp1,
  UTGp2,
  MP1,
  MP2,
  // LJ,
  HJ,
  CO,
  BTN,
  SB,
  BB;

  String get name  {
    switch (this) {
      case Position.UTG:
        return 'UTG';
      case Position.UTGp1:
        return 'UTG+1';
      case Position.UTGp2:
        return 'UTG+2';
      case Position.MP1:
        return 'MP1';
      case Position.MP2:
        return 'MP2';
      case Position.HJ:
        return 'HJ';
      case Position.CO:
        return 'CO';
      case Position.BTN:
        return 'BTN';
      case Position.SB:
        return 'SB';
      case Position.BB:
        return 'BB';
    }
  }
}
