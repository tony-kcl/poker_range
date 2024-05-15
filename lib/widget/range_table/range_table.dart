import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/extension/extension.dart';
import 'package:poker_range/model/position_range.dart';
import 'package:poker_range/widget/range_table/range_table_cubit.dart';

class RangeTable extends StatefulWidget {
  const RangeTable(
      {super.key, required this.ranges, required this.rangeTableCubit});

  final List<PositionRange> ranges;

  final RangeTableCubit rangeTableCubit;

  @override
  State<RangeTable> createState() => _RangeTableState();
}

class _RangeTableState extends State<RangeTable> {
  List<String> mStringList = [];
  // int selectedIndex = 0;
  bool? isSelect;

  static const List<String> cards = [
    'A',
    'K',
    'Q',
    'J',
    'T',
    '9',
    '8',
    '7',
    '6',
    '5',
    '4',
    '3',
    '2'
  ];

  @override
  void initState() {
    for (var card in cards) {
      for (var card2 in cards) {
        if (card == card2) {
          mStringList.add(card + card2);
        } else if (card.priority > card2.priority) {
          mStringList.add('${card + card2}s');
        } else {
          mStringList.add('${card2 + card}o');
        }
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<RangeTableCubit, int>(
      bloc: widget.rangeTableCubit,
      builder: (context, selectedIndex) {
        return InteractiveViewer(
          minScale: 1,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 13),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return DragTarget<int>(onMove: (event) {
                final currentState = isSelect;
                if (currentState != null) {
                  widget.ranges[selectedIndex].range[index] = currentState;
                }
              }, builder: (context, _, __) {
                Color currentColor = theme.colorScheme.background;
                for (var positionRange in widget.ranges.reversed) {
                  if (positionRange.range[index]) {
                    currentColor = positionRange.paintColor;
                    break;
                  }
                }
                return LongPressDraggable<int>(
                  maxSimultaneousDrags: 1,
                  data: 1,
                  feedback: const SizedBox(),
                  child: GestureDetector(
                    onTapDown: (_) {
                      if (widget.ranges[selectedIndex].range[index]) {
                        isSelect = false;
                      } else {
                        isSelect = true;
                      }
                    },
                    onTapUp: (_) {
                      isSelect = null;
                    },
                    child: GestureDetector(
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            widget.ranges[selectedIndex].range[index] =
                                !widget.ranges[selectedIndex].range[index];
                          });
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: currentColor,
                        ),
                        child: Center(
                          child: Text(
                            mStringList[index],
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
            },
            itemCount: mStringList.length,
          ),
        );
      },
    );
  }
}
