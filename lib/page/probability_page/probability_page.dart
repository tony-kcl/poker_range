import 'package:flutter/material.dart';
import 'package:poker_range/helper/winRate/win_rate_calculator.dart';

import 'widget/probability_list_tile.dart';

class ProbabilityPage extends StatelessWidget {
  const ProbabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {}, 
            child: Text(
              '編輯',
              style: theme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ProbabilityListTile(
                      title: '買花',
                      winRate: WinRateCalculator.calculateByOuts(9),
                    ),
                    ProbabilityListTile(
                      title: '買兩頭順',
                      winRate: WinRateCalculator.calculateByOuts(8),
                    ),
                    ProbabilityListTile(
                      title: '5 Outs',
                      winRate: WinRateCalculator.calculateByOuts(5),
                    ),
                    ProbabilityListTile(
                      title: '4 Outs',
                      winRate: WinRateCalculator.calculateByOuts(4),
                    ),
                    ProbabilityListTile(
                      title: '3 Outs',
                      winRate: WinRateCalculator.calculateByOuts(3),
                    ),
                    ProbabilityListTile(
                      title: '2 Outs',
                      winRate: WinRateCalculator.calculateByOuts(2),
                    ),
                    ProbabilityListTile(
                      title: '1 Out',
                      winRate: WinRateCalculator.calculateByOuts(1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}