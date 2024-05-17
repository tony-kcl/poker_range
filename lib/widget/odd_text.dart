import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '代表底池必須為投入的籌碼的${widget.winRate}倍,\n'
                    '對手下注1元, 底池必須有${widget.winRate - 2}元才足夠跟注1元(1+${widget.winRate - 2}+1)\n'
                    '也代表對手的下注必須小於等於底池的'
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Text(
        'Max Bet: ${widget.winRate/(100 - 2 * widget.winRate) * 100} %',
        style: theme.textTheme.titleLarge?.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: theme.colorScheme.primary,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}