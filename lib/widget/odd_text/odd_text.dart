import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        'Max Bet: ${(widget.winRate/(100 - 2 * widget.winRate) * 100).round()} %',
        style: theme.textTheme.titleLarge?.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: theme.colorScheme.primary,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}