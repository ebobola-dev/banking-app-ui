import 'package:baking_app_ui/config.dart';
import 'package:baking_app_ui/models/charts_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Charts extends StatelessWidget {
  final AnimationController animationController;
  const Charts({Key? key, required this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ChartTypes.values
          .map((chartType) => ChartsItem(
                chartType: chartType,
                animationController: animationController,
              ))
          .toList(),
    );
  }
}

class ChartsItem extends StatelessWidget {
  final ChartTypes chartType;
  final AnimationController animationController;
  const ChartsItem({
    Key? key,
    required this.animationController,
    required this.chartType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50.0,
          height: 150.0,
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(color: ChartColors.chartStrokeColor),
            boxShadow: [
              BoxShadow(
                color: ChartColors.chartStrokeColor.withOpacity(.02),
                blurRadius: 5,
              ),
              const BoxShadow(
                color: ChartColors.chartBGColor,
                spreadRadius: -2.0,
                blurRadius: 2.0,
              ),
            ],
          ),
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              final animation = Tween(
                begin: 40.0 / 140.0,
                end: Config.chartValues[chartType],
              ).animate(CurvedAnimation(
                parent: animationController,
                curve: Config.mainCurve,
              ));
              return Container(
                width: 40.0,
                height: animation.value * 140.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  gradient: LinearGradient(
                    colors: ChartColors.chartItemColors[chartType]!,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ChartColors.chartItemColors[chartType]![0]
                          .withOpacity(.32),
                      offset: const Offset(0, 10),
                      blurRadius: 15,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        SvgPicture.asset(
          Config.chartSvgPaths[chartType]!,
          color: ChartColors.chartItemColors[chartType]![0],
        ),
      ],
    );
  }
}
