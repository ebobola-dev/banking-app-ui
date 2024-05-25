import 'package:baking_app_ui/config.dart';
import 'package:flutter/material.dart';

class BankCardImage extends StatelessWidget {
  final AnimationController animationController;
  const BankCardImage({
    super.key,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        final animation = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animationController,
          curve: Config.mainCurve,
        ));
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0x80d2bbaa),
                offset: Offset(0, animation.value * 5),
                blurRadius: animation.value * 20,
              ),
            ],
          ),
          child: Image.asset("assets/images/bank-card.png"),
        );
      },
    );
  }
}
