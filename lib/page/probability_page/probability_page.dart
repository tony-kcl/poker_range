import 'package:flutter/material.dart';

import 'widget/probability_list_tile.dart';

class ProbabilityPage extends StatelessWidget {
  const ProbabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              ProbabilityListTile(
                title: '買花',
                flopProbability: 10,
                turnProbability: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}