import 'package:flutter/material.dart';

class HintDialog extends StatefulWidget {
  const HintDialog({
    super.key,
    required this.winRate,
  });

  final double winRate;

  @override
  State<HintDialog> createState() => _HintDialogState();
}

class _HintDialogState extends State<HintDialog> {
  double maxBet = 0;

  late int _potPercentage;

  @override
  void initState() {
    _potPercentage = (widget.winRate/(100 - 2 * widget.winRate) * 100).round();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '代表對手的下注必須小於等於底池的$_potPercentage%, 跟注的期望值才是正的',
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pot: ',
                  style: theme.textTheme.bodyLarge,
                ),
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: theme.textTheme.bodyLarge,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    onChanged: (val) {
                      final pot = double.tryParse(val);
                      if (pot != null) {
                        if (mounted) {
                          setState(() {
                            maxBet = pot * _potPercentage / 100;
                          });
                        }
                      }
                    },
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  'Max bet: $maxBet',
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}