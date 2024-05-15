import 'package:flutter/material.dart';
import 'package:poker_range/model/ten_people_range_table.dart';
import 'package:poker_range/widget/range_table/range_table.dart';
import 'package:poker_range/widget/range_table/range_table_cubit.dart';

class SetRangePage extends StatelessWidget {
  const SetRangePage({
    super.key,
    required this.data,
  });

  final PeopleRangeTable data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            color: Colors.yellow,
            child: RangeTable(
              ranges: data.ranges,
              rangeTableCubit: RangeTableCubit(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.amber,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(data.ranges[index].position.name),
                  ],
                );
              }, 
              separatorBuilder: (_, __) => const Divider(), 
              itemCount: data.ranges.length,
            ),
          )
        ),
      ],
    );
  }
}