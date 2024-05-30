import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poker_range/helper/winRate/win_rate_calculator.dart';
import 'package:poker_range/model/probability_record.dart';

class AddRecordDialog extends StatefulWidget {
  const AddRecordDialog({super.key});

  @override
  State<AddRecordDialog> createState() => _AddRecordDialogState();
}

class _AddRecordDialogState extends State<AddRecordDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _outsController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _outsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  '標題: ',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(width: 10,),
                Flexible(
                  child: TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    style: theme.textTheme.titleLarge,
                    controller: _titleController,
                  ),
                ),
                const SizedBox(width: 10,),
              ],
            ),
            Row(
              children: [
                Text(
                  'Outs: ',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(width: 10,),
                Flexible(
                  child: TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    controller: _outsController,
                    keyboardType: TextInputType.number,
                    style: theme.textTheme.titleLarge,
                    decoration: const InputDecoration(
                      counterText: '',
                    ),
                    maxLength: 2,
                  ),
                ),
                const SizedBox(width: 10,),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, 
                  child: Text(
                    '取消',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                const SizedBox(width: 15,),
                TextButton(
                  onPressed: () {
                    if (_titleController.text.isEmpty || _outsController.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: _titleController.text.isEmpty ? '標題不能為空' : 'Outs不能為空',
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: theme.colorScheme.background,
                      );
                    } else {
                      final record = ProbabilityRecord(
                        title: _titleController.text,
                        winRate: WinRateCalculator.calculateByOuts(int.tryParse(_outsController.text) ?? 0),
                      );
                      Navigator.of(context).pop<ProbabilityRecord>(record);
                    }
                  },
                  child: Text(
                    '新增',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}