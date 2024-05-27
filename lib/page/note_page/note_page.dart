import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/page/note_page/note_bloc/note_bloc.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '注意事項',
          style: theme.textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => NoteBloc(),
          child: BlocBuilder<NoteBloc, NoteState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: ReorderableListView.builder(
                      itemBuilder: (context, index) {
                        // final record = state.records[index];
                        return Container(
                          key: Key('$index'),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                duration: state.isModifying
                                    ? const Duration(milliseconds: 500)
                                    : Duration.zero,
                                width: state.isModifying ? 24 : 0,
                                height: 24,
                                child: state.isModifying
                                    ? IconButton(
                                        onPressed: () {
                                          context.read<NoteBloc>();
                                          // context.read<ProbabilityBloc>().add(
                                          //     ProbabilityRemoveRecordEvent(
                                          //         index));
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: theme.colorScheme.error,
                                          size: 24,
                                        ),
                                      )
                                    : const SizedBox(),
                              ),
                              Expanded(
                                child: Text('測試'),
                              ),
                            ],
                          ),
                        );
                      },
                      // itemCount: state.records.length,
                      itemCount: 10,
                      onReorder: (oldIndex, newIndex) => {
                        context.read<NoteBloc>()
                        // context.read<ProbabilityBloc>().add(
                        //     ProbabilitySwapIndexEvent(
                        //         oldIndex: oldIndex, newIndex: newIndex))
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
