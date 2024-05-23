import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_range/theme/theme.dart';
import 'package:poker_range/theme/theme_cubit.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, MyThemeData>(
      builder: (context, theme) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              '主題設定',
              style: theme.themeData.textTheme.titleLarge,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 48,
                    child: Text(
                      '主題顏色',
                      style: theme.themeData.textTheme.titleLarge,
                    ),
                  ),
                  const Wrap(
                    spacing: 20,
                    children: [
                      _ColorSquare(Colors.blue),
                      _ColorSquare(Colors.purple),
                      _ColorSquare(Colors.pink),
                      _ColorSquare(Colors.green),
                      _ColorSquare(Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        Text(
                          '深色模式',
                          style: theme.themeData.textTheme.titleLarge,
                        ),
                        const Expanded(child: SizedBox()),
                        CupertinoSwitch(
                          value: theme.themeData.brightness == Brightness.dark, 
                          onChanged: (val) {
                            context.read<ThemeCubit>().changeTheme(brightness: val ? Brightness.dark : Brightness.light);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ColorSquare extends StatelessWidget {
  const _ColorSquare(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, MyThemeData>(
      builder: (context, theme) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.read<ThemeCubit>().changeTheme(seedColor: color);
          },
          child: Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: theme.seedColor.value == color.value ? Border.all(
                width: 2,
                color: theme.themeData.colorScheme.outline,
              ) : null
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: color,
                ),
              ),
            ),
          ),          
        );
      },
    );
  }
}
