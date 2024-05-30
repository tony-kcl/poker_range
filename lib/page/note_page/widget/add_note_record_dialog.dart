import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNoteRecordDialog extends StatefulWidget {
  const AddNoteRecordDialog({super.key});

  @override
  State<AddNoteRecordDialog> createState() => _AddNoteRecordDialogState();
}

class _AddNoteRecordDialogState extends State<AddNoteRecordDialog> {
  final TextEditingController _noteController = TextEditingController();
  
  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
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
            Row(
              children: [
                Text(
                  '事項: ',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(width: 10,),
                Flexible(
                  child: TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    style: theme.textTheme.titleLarge,
                    controller: _noteController,
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
                    if (_noteController.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: '事項不能為空',
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: theme.colorScheme.background,
                      );
                    } else {
                      Navigator.of(context).pop<String>(_noteController.text);
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