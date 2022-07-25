import 'dart:ui';

import 'package:baking_app_ui/pages/home/widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(35.0);
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.white.withOpacity(.05),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => NavBarItem(
                index: index,
                activeColor: Theme.of(context).primaryColor,
                inactiveColor:
                    Theme.of(context).iconTheme.color!.withOpacity(.3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
