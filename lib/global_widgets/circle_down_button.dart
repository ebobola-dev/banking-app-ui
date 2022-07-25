import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleDownButton extends StatelessWidget {
  final VoidCallback onTap;
  const CircleDownButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.0,
      height: 30.0,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: ThemeConfig.buttonColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/svg/arrow-down.svg',
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
