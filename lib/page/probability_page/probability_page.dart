import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/model/probability_record.dart';
import 'package:poker_range/page/probability_page/bloc/probability_bloc.dart';
import 'package:poker_range/page/probability_page/widget/add_record_dialog.dart';

import 'widget/probability_list_tile.dart';

class ProbabilityPage extends StatelessWidget {
  const ProbabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProbabilityBloc, ProbabilityState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            actions: [
              TextButton(
                onPressed: () {
                  context.read<ProbabilityBloc>().add(ProbabilityToggleModifyEvent(!state.isModifying));
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Pot: ',
                        style: theme.textTheme.headlineMedium,
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: theme.textTheme.headlineMedium,
                          onTapOutside: (_) => FocusScope.of(context).unfocus(),
                          onChanged: (value) {
                            context.read<ProbabilityBloc>().add(ProbabilitySetPotEvent(double.tryParse(value)));
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ReorderableListView.builder(
                      itemBuilder: (context, index) {
                        final record = state.records[index];
                        return Container(
                          key: Key('$index'),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                duration: state.isModifying ? const Duration(milliseconds: 500) : Duration.zero,
                                width: state.isModifying ? 24 : 0,
                                // height: 24,
                                child: state.isModifying ? IconButton(
                                  onPressed: () {
                                    context.read<ProbabilityBloc>().add(ProbabilityRemoveRecordEvent(index));
                                  }, 
                                  icon: Icon(
                                    Icons.delete,
                                    color: theme.colorScheme.error,
                                    size: 24,
                                  ),
                                ) : const SizedBox(),
                              ),
                              Expanded(
                                child: ProbabilityListTile(                                
                                  title: record.title,
                                  winRate: record.winRate,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: state.records.length,
                      onReorder: (oldIndex, newIndex) => {
                        context.read<ProbabilityBloc>().add(ProbabilitySwapIndexEvent(oldIndex: oldIndex, newIndex: newIndex))
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
              showCupertinoDialog<ProbabilityRecord>(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return const AddRecordDialog();
                }
              ).then((record) {
                if (record != null) {
                  context.read<ProbabilityBloc>().add(ProbabilityAddRecordEvent(record));
                }
              });
            },
          ),
        );
      },
    );
  }
}