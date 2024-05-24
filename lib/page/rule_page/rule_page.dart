import 'package:flutter/material.dart';
import 'package:poker_range/widget/poker_table/poker_table.dart';

class RulePage extends StatelessWidget {
  const RulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: ListView(
        children: [
          PokerTable(
            width: screenSize.width
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _RuleListTile(
                  title: Text(
                    '遊戲準備',
                    style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  gap: 10,
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  children: const [
                    '1. 決定座位',
                    '2. 從荷官順時鐘方向一人發一張牌, 最大的為Dealer位(上圖的Btn)',
                  ],
                ),
                const SizedBox(height: 20,),
                _RuleListTile(
                  title: Text(
                    '遊戲流程',
                    style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  gap: 10,
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  children: const [
                    '1. 小盲位置放置0.5個BB(大盲), 大盲位置放置1個BB',
                    '2. 從小盲開始順時鐘發牌一次一張共兩張',
                    '3. 由UTG(大盲後的順時鐘第一位)開始依次行動(棄牌/加注/跟注)',
                    '4. 進入翻牌圈, 荷官蓋掉一張牌之後打開3張牌',
                    '5. 由小盲(若小盲沒有牌,則由小盲之後順時鐘開始第一位有牌的玩家)開始行動(過牌/加注)',
                    '6. 進入轉牌, 荷官蓋掉一張牌之後打開1張牌',
                    '7. 由小盲(若小盲沒有牌,則由小盲之後順時鐘開始第一位有牌的玩家)開始行動(過牌/加注)',
                    '8. 進入河牌, 荷官蓋掉一張牌之後打開1張牌',
                    '9. 由小盲(若小盲沒有牌,則由小盲之後順時鐘開始第一位有牌的玩家)開始行動(過牌/加注)',
                    '10. 若河牌沒有人下注則由小盲順時鐘依序開牌比大小, 牌型最大的人收下底池, 若是有人下注則由最後主動下注的人開始順時鐘開牌',
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RuleListTile extends StatelessWidget {
  const _RuleListTile({
    required this.title,
    required this.children,
    required this.style,
    this.gap = 10,
  });

  final Widget title;

  final List<String> children;

  final TextStyle? style;

  /// [children] 之間的間距
  final double gap;

  List<Widget> _buildChildren() {
    final List<Widget> widgets = [];
    for (int i = 0; i < children.length; i++) {
      widgets.add(Flexible(child: Text(children[i], style: style,)));
      if (i != children.length -1) {
        widgets.add(SizedBox(height: gap,));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        title,
        SizedBox(height: gap,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildChildren(),
          ),
        ),
      ],
    );
  }
}