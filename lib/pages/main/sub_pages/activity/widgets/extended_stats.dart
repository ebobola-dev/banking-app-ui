import 'dart:developer';

import 'package:baking_app_ui/global_widgets/circle_down_button.dart';
import 'package:flutter/material.dart';

class ExtendedStats extends StatelessWidget {
  const ExtendedStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Extended stats',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(width: 10),
        CircleDownButton(
          onTap: () {
            log('tap on extended stats');
          },
        ),
      ],
    );
  }
}
