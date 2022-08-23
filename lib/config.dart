import 'package:baking_app_ui/models/charts_types.dart';
import 'package:flutter/material.dart';

class Config {
  static const pagesSvg = [
    'assets/svg/home.svg',
    'assets/svg/chart.svg',
    'assets/svg/small-bank-card.svg',
    'assets/svg/settings.svg',
  ];

  static const chartValues = {
    ChartTypes.car: .67,
    ChartTypes.shop: .83,
    ChartTypes.truck: .28,
    ChartTypes.food: .53,
  };
  static const chartSvgPaths = {
    ChartTypes.car: 'assets/svg/car.svg',
    ChartTypes.shop: 'assets/svg/shopping-bag.svg',
    ChartTypes.truck: 'assets/svg/truck.svg',
    ChartTypes.food: 'assets/svg/cutlery.svg',
  };

  static const mainCurve = Curves.easeOutQuart;
}

class BottomSheetHeights {
  static const min = .4;
  static const middle = .6;
  static const max = .96;
}

class ChartColors {
  static const achievementCircleColors = [
    Color(0xFF87FBA2),
    Color(0xFF697FD8),
  ];
  static const chartBGColor = Color(0xFF1C1C1C);
  static const chartStrokeColor = Color(0x0DFAFAFA);
  static const chartItemColors = {
    ChartTypes.car: [
      Color(0xFFFF6565),
      Color(0xFFFFCD9F),
    ],
    ChartTypes.shop: [
      Color(0xFF65FFD1),
      Color(0xFF9FC5FF),
    ],
    ChartTypes.truck: [
      Color(0xFFFF65F9),
      Color(0xFFFF9FC7),
    ],
    ChartTypes.food: [
      Color(0xFF7B65FF),
      Color(0xFF9FBFFF),
    ],
  };
}
