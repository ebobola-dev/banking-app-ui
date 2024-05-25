import 'dart:math' show pi;

import 'package:baking_app_ui/config.dart';
import 'package:flutter/material.dart';

const circleCircleSize = Size(240, 240);
const circleBgStrokeWidth = 25.0;
const circleStrokeWidth = 15.0;

class AchievementProgress extends StatelessWidget {
  final int progress;
  final AnimationController animationController;
  const AchievementProgress({
    super.key,
    required this.progress,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: circleCircleSize,
          painter: ProgressBackgroundPainter(),
        ),
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            final animation = Tween(
              begin: 0.0,
              end: progress * .01,
            ).animate(CurvedAnimation(
              parent: animationController,
              curve: Config.mainCurve,
            ));
            return CustomPaint(
              size: circleCircleSize,
              painter: ProgressForegroundPainter(
                value: animation.value,
              ),
            );
          },
        ),
        Column(
          children: [
            // AnimatedSwitcher(
            //   duration: const Duration(milliseconds: 50),
            //   transitionBuilder: (child, animation) {
            //     return SlideTransition(
            //       position: Tween(
            //         begin: Offset(
            //           0,
            //           animation.status == AnimationStatus.reverse ? .5 : -1,
            //         ),
            //         end: Offset.zero,
            //       ).animate(animation),
            //       child: child,
            //     );
            //   },
            //   child: Text(
            //     '${_intAnimation.value}%',
            //     key: ValueKey(_intAnimation.value),
            //     style: const TextStyle(
            //       fontSize: 40.0,
            //       fontWeight: FontWeight.bold,
            //       fontFamily: 'Metropolis',
            //     ),
            //   ),
            // ),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                final animation = IntTween(
                  begin: 0,
                  end: progress,
                ).animate(CurvedAnimation(
                  parent: animationController,
                  curve: Config.mainCurve,
                ));
                return Text(
                  '${animation.value}%',
                  key: ValueKey(animation.value),
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Metropolis',
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Text(
              'To discover a new\nachievement',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class ProgressBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width * .5;
    final center = Offset(radius, radius);
    final Paint paint = Paint()
      ..color = ChartColors.chartBGColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleBgStrokeWidth
      ..strokeCap = StrokeCap.round;
    final Paint strokePaint = Paint()
      ..color = ChartColors.chartStrokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        width: radius * 2,
        height: radius * 2,
      ),
      pi / 2,
      pi * 2,
      false,
      paint,
    );
    //* INSIDE STROKE
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        width: radius * 2 - circleBgStrokeWidth,
        height: radius * 2 - circleBgStrokeWidth,
      ),
      pi / 2,
      pi * 2,
      false,
      strokePaint,
    );
    //* OUTSIDE STROKE
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        width: radius * 2 + circleBgStrokeWidth,
        height: radius * 2 + circleBgStrokeWidth,
      ),
      pi / 2,
      pi * 2,
      false,
      strokePaint,
    );
    final path = Path();
    canvas.drawShadow(
      path,
      ChartColors.chartStrokeColor,
      25.0,
      false,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ProgressForegroundPainter extends CustomPainter {
  final double value;
  ProgressForegroundPainter({
    required this.value,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width * .5;
    final center = Offset(radius, radius);
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: ChartColors.achievementCircleColors,
      ).createShader(Rect.fromCircle(
        center: center,
        radius: radius,
      ))
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleStrokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        width: radius * 2,
        height: radius * 2,
      ),
      -pi / 2,
      2 * pi * value,
      false,
      paint,
    );
    final path = Path();
    // path.arcTo(
    //   Rect.fromCenter(
    //     center: center,
    //     width: radius * 2,
    //     height: radius * 2,
    //   ),
    //   -pi / 2,
    //   2 * pi * value,
    //   false,
    // );
    path.addArc(
      Rect.fromCenter(
        center: center,
        width: radius * 2,
        height: radius * 2,
      ),
      -pi / 2,
      2 * pi * value,
    );
    path.close();
    // canvas.drawShadow(
    //   path,
    //   ChartColors.achievementCircleColors[0],
    //   5.0,
    //   false,
    // );
    // for (final color in ChartColors.achievementCircleColors) {
    //   canvas.drawShadow(
    //     path,
    //     color,
    //     5.0,
    //     false,
    //   );
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
