import 'dart:ui';

import 'package:baking_app_ui/config.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

const clipHeight = 85.0;
const widthsList = [0.13, 0.27, 0.33, 0.47, 0.52, 0.57, 0.69, 0.73, 0.86];

class BottomClip extends StatefulWidget {
  final double screenWidth;
  final AnimationController animationController;
  const BottomClip({
    super.key,
    required this.animationController,
    required this.screenWidth,
  });

  @override
  State<BottomClip> createState() => _BottomClipState();
}

class _BottomClipState extends State<BottomClip> {
  late Path _path;

  @override
  void initState() {
    super.initState();
    _path = drawPath(widget.screenWidth, clipHeight);
  }

  Path drawPath(double w, double h) {
    Path path = Path()
      ..moveTo(0, h / 4 * 3)
      ..quadraticBezierTo(w * .13, -h / 8, w * .27, h / 2) //* GOOD
      ..cubicTo(
        w * .33,
        h / 4 * 3 + h / 16,
        w * .47,
        h / 16 * 13,
        w * .5,
        h / 2 - h / 12,
      )
      ..cubicTo(
        w * .54,
        -h / 4 + h / 16,
        w * .69,
        -h / 64,
        w * .73,
        h / 4,
      )
      ..quadraticBezierTo(w * .86, h, w, h / 4);
    return path;
  }

  Offset? calculate(value) {
    PathMetrics pathMetrics = _path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos?.position;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: BottomClipper(),
          child: Container(
            width: screenWidth,
            height: clipHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x33FF59B3), Color(0x33596AFF)],
              ),
            ),
          ),
        ),
        CustomPaint(
          size: Size(screenWidth, clipHeight),
          painter: LinePainter(path: _path),
        ),
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (context, _) {
            final animation = Tween(
              begin: 0.0,
              end: 0.6,
            ).animate(CurvedAnimation(
              parent: widget.animationController,
              curve: Config.mainCurve,
            ));
            return Positioned(
              left: calculate(animation.value)?.dx ?? 0,
              top: (calculate(animation.value)?.dy ?? 0) - 15,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFFD1B0FF),
                      Color(0xFFFFFFFF),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26232323),
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    Path path = Path()
      ..moveTo(0, h / 4 * 3)
      ..quadraticBezierTo(w * .13, -h / 8, w * .27, h / 2) //* GOOD
      ..cubicTo(
        w * .33,
        h / 4 * 3 + h / 16,
        w * .47,
        h / 16 * 13,
        w * .5,
        h / 2 - h / 12,
      )
      ..cubicTo(
        w * .54,
        -h / 4 + h / 16,
        w * .69,
        -h / 64,
        w * .73,
        h / 4,
      )
      ..quadraticBezierTo(w * .86, h, w, h / 4)
      ..lineTo(w, 0)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..lineTo(0, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class LinePainter extends CustomPainter {
  final Path path;
  LinePainter({required this.path});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(size.width, 0),
        [
          const Color(0xFFFF59B3),
          const Color(0xFF596AFF),
        ],
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
