import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => RangeTableCubit(),
      child: BlocBuilder<RangeTableCubit, int>(
        builder: (context, state) {
          return Column(
            children: [
              RangeTable(
                ranges: data.ranges,
                rangeTableCubit: context.read<RangeTableCubit>(),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.read<RangeTableCubit>().setSelectedIndex(index);
                      },
                      child: Container(
                        color: data.ranges[index].paintColor?.withOpacity(.3),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Row(
                          children: [
                            Text(data.ranges[index].position.name),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(height: 1, thickness: 1,),
                  itemCount: data.ranges.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
