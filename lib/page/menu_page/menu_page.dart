import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poker_range/route/routes.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.settingPage);
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
          const SizedBox(width: 5,),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.pushNamed(Routes.probabilityPage);
              },
              child: Text(
                '常見機率',
                style: theme.textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}