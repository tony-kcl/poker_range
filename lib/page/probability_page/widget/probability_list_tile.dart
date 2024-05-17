import 'package:flutter/material.dart';
import 'package:poker_range/widget/odd_text.dart';

class ProbabilityListTile extends StatelessWidget {
  const ProbabilityListTile({
    super.key,
    required this.title,
    required this.flopProbability,
    required this.turnProbability,
  });

  final String title;

  final double flopProbability;

  final double turnProbability;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            title,
            style: theme.textTheme.headlineMedium,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '翻牌: ' + '$flopProbability%',
                      style: theme.textTheme.titleLarge,
                    ),
                    const OddText(winRate: 25,),
                  ],
                ),
                Text(
                  '轉牌: ' + '$turnProbability%',
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}