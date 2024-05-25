import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget leftWidget;
  final Widget rightWidget;
  const Header({
    super.key,
    required this.leftWidget,
    required this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget,
        rightWidget,
      ],
    );
  }
}
