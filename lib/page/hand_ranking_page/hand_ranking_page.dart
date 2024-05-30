import 'package:flutter/material.dart';

class HandRankingPage extends StatelessWidget {
  const HandRankingPage({super.key});

  TableRow _buildTableRow(String title1, String title2, String title3, TextStyle? textTheme) {
    return TableRow(
      children: [
        _TableCell(
          child: Center(
            child: Text(
              title1, 
              style: textTheme,
            ),
          ),
        ),
        _TableCell(
          child: Center(
            child: Text(
              title2, 
              style: textTheme,
            ),
          ),
        ),
        _TableCell(
          child: Center(
            child: Text(
              title3, 
              style: textTheme,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme.headlineSmall;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          '牌型大小',
          style: theme.textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Table(
                border: TableBorder.all(color: theme.colorScheme.onBackground),
                children: [
                  _buildTableRow('牌型', '解釋', '例子', textTheme),
                  _buildTableRow('同花順', '相同花色的順子', '紅桃6,7,8,9,10', textTheme),
                  _buildTableRow('四條/鐵支', '4張相同點數的牌+任意一張單牌', '7777+A', textTheme),
                  _buildTableRow('葫蘆', '3張相同點數的牌+2張相同點數的牌', 'AAA+KK', textTheme),
                  _buildTableRow('同花', '任意5張相同花色的牌', '紅桃A,J,8,6,2', textTheme),
                  _buildTableRow('順子', '5張連續點數花色不限的牌', '3,4,5,6,7', textTheme),
                  _buildTableRow('三條', '3張相同點數的牌+任意兩張單牌', '888+AK', textTheme),
                  _buildTableRow('兩對', '兩個一對+任意一張單牌', '88+66+A', textTheme),
                  _buildTableRow('一對', '2張點數相同的牌+3張單牌', 'AA+K+Q+J', textTheme),
                  _buildTableRow('高牌', '5張單牌', 'A,K,9,8,5', textTheme),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  const _TableCell({required this.child,});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}