import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poker_range/route/routes.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '設定',
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                context.pushNamed(Routes.themePage);
              },
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    const SizedBox(width: 10,),
                    Text(
                      '主題設定',
                      style: theme.textTheme.titleLarge,
                    ),
                    const Expanded(child: SizedBox()),
                    const Icon(
                      Icons.chevron_right,
                      size: 32,
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}