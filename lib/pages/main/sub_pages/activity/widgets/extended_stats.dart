import 'dart:developer';

import 'package:baking_app_ui/global_widgets/circle_down_button.dart';
import 'package:flutter/material.dart';

class ExtendedStats extends StatelessWidget {
  const ExtendedStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Extended stats',
          style: Theme.of(context).textTheme.headline1,
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
