import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/helper/shared_preference/shared_preference_helper.dart';
import 'package:poker_range/page/note_page/note_bloc/note_bloc.dart';
import 'package:poker_range/page/note_page/widget/add_note_record_dialog.dart';
import 'package:poker_range/repository/note/note_impl.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
        NoteBloc(NoteSharedPreferenceImpl(SharedPreferencesHelper().pref))..add(NoteLoadRecordEvent()),
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              title: Text(
                '注意事項',
                style: theme.textTheme.headlineMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.read<NoteBloc>().add(NoteToggleModifyEvent(!state.isModifying));
                  },
                  child: Text(
                    state.isModifying ? '完成' : '編輯',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: ReorderableListView.builder(
                        itemBuilder: (context, index) {
                          final record = state.noteRecords[index];
                          return Container(
                            key: Key('$index'),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    AnimatedContainer(
                                      duration: state.isModifying
                                          ? const Duration(
                                              milliseconds: 500)
                                          : Duration.zero,
                                      width: state.isModifying ? 40 : 0,
                                      child: state.isModifying
                                          ? Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  context.read<NoteBloc>().add(NoteRemoveRecordEvent(index));
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color:
                                                      theme.colorScheme.error,
                                                  size: 24,
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '• $record',
                                        style: theme.textTheme.titleLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: state.noteRecords.length,
                        onReorder: (oldIndex, newIndex) => {
                          context.read<NoteBloc>().add(NoteChangeIndexEvent(
                              oldIndex: oldIndex, newIndex: newIndex))
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(
                Icons.add,
                size: 32,
              ),
              onPressed: () {
                showCupertinoDialog<String>(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return const AddNoteRecordDialog();
                    }).then((record) {
                  if (record != null) {
                    context.read<NoteBloc>().add(NoteAddRecordEvent(record));
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
