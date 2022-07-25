import 'dart:developer';

import 'package:baking_app_ui/global_widgets/circle_down_button.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$14,095',
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(width: 10),
        CircleDownButton(
          onTap: () {
            log('tap on avatar');
          },
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 20.0,
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
      ],
    );
  }
}
