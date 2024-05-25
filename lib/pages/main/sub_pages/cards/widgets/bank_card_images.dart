import 'package:baking_app_ui/config.dart';
import 'package:flutter/material.dart';

class BankCardImages extends StatelessWidget {
  final AnimationController animationController;
  const BankCardImages({
    super.key,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 161.56 + 30 + 29 + 19.32,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          final animation = Tween(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animationController,
            curve: Config.mainCurve,
          ));
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: (30 + 29 + 19.32) * animation.value,
                child: Image.asset(
                  'assets/images/bank-card-4.png',
                  height: 161.56,
                ),
              ),
              Positioned(
                top: (30 + 29) * animation.value,
                child: Image.asset(
                  'assets/images/bank-card-3.png',
                  height: 161.56,
                ),
              ),
              Positioned(
                top: 30 * animation.value,
                child: Image.asset(
                  'assets/images/bank-card-2.png',
                  height: 161.56,
                ),
              ),
              Image.asset(
                'assets/images/bank-card-1.png',
                height: 161.56,
              ),
            ],
          );
        },
      ),
    );
  }
}
