import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/model/win_rate.dart';
import 'package:poker_range/page/probability_page/bloc/probability_bloc.dart';
import 'package:poker_range/widget/odd_text/odd_text.dart';

class ProbabilityListTile extends StatelessWidget {
  const ProbabilityListTile({
    super.key,
    required this.title,
    required this.winRate,
  });

  final String title;

  final WinRate winRate;

  static const double spacing = 5;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProbabilityBloc, ProbabilityState>(
      builder: (context, state) {
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${state.flopToRiver ?? '翻牌到河牌'}: ' + '${winRate.flopToRiver}%',
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          if (!state.isModifying) ... [
                            OddText(
                              winRate: winRate.flopToRiver,
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: spacing,
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${state.flopToTurn ?? '翻牌到轉牌'}: ' + '${winRate.flopToTurn}%',
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          if (!state.isModifying) ... [
                            OddText(
                              winRate: winRate.flopToTurn,
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: spacing,
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${state.turnToRiver ?? '轉牌到河牌'}: ' + '${winRate.turnToRiver}%',
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          if (!state.isModifying) ... [
                            OddText(
                              winRate: winRate.turnToRiver,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
