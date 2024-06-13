import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/page/probability_page/bloc/probability_bloc.dart';
import 'package:poker_range/widget/odd_text/hint_dialog.dart';

class OddText extends StatefulWidget {
  const OddText({
    super.key,
    required this.winRate,
  });

  final double winRate;

  @override
  State<OddText> createState() => _OddTextState();
}

class _OddTextState extends State<OddText> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocSelector<ProbabilityBloc, ProbabilityState, double?>(
      selector: (state) => state.potSize,
      builder: (context, potSize) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => HintDialog(
                winRate: widget.winRate,
              ),
            );
          },
          child: Text(
            potSize != null 
              ? 'Max Bet: ${(widget.winRate / (100 - 2 * widget.winRate) * potSize).round()}'
              : 'Max Bet: ${(widget.winRate / (100 - 2 * widget.winRate) * 100).round()} %',
            style: theme.textTheme.titleLarge?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: theme.colorScheme.primary,
              color: theme.colorScheme.primary,
            ),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        );
      },
    );
  }
}
