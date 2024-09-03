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
          style: theme.textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _OptionRow(
              title: '主題設定',
              onTap: () {
                context.pushNamed(Routes.themePage);
              },
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _OptionRow(
              title: '文字設定',
              onTap: () {
                context.pushNamed(Routes.textSettingPage);
              },
            ),
            const Expanded(child: SizedBox()),
            _OptionRow(
              title: '3rd party open source library license',
              hideArrow: true,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LicensePage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

class _OptionRow extends StatelessWidget {
  const _OptionRow({
    required this.title,
    required this.onTap,
    this.hideArrow = false,
  });

  final String title;

  final VoidCallback onTap;

  final bool hideArrow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 48,
        child: Row(
          children: [
            const SizedBox(width: 20,),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
            if (!hideArrow) ... [
              const SizedBox(width: 10,),
              const Icon(
                Icons.chevron_right,
                size: 32,
              ),
            ],
            const SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}