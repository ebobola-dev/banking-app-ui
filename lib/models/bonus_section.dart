import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BonusSection extends Equatable {
  final String title;
  final String subtitle;
  final String svgPath;
  final Color lbColor;
  final Color rtColor;

  const BonusSection({
    required this.title,
    required this.subtitle,
    required this.svgPath,
    required this.lbColor,
    required this.rtColor,
  });

  @override
  List<Object> get props => [
        title,
        subtitle,
        svgPath,
        lbColor,
        rtColor,
      ];
}

const List<BonusSection> bonusSections = [
  BonusSection(
    title: 'Entertainment',
    subtitle: 'Increased cashback',
    svgPath: 'assets/svg/cassette.svg',
    lbColor: Color(0xFF9CA0FF),
    rtColor: Color(0xFFFFD89F),
  ),
  BonusSection(
    title: 'Bonuses',
    subtitle: 'More bonus categories',
    svgPath: 'assets/svg/gift.svg',
    lbColor: Color(0xFFFF9CA2),
    rtColor: Color(0xFFECFF9F),
  ),
  BonusSection(
    title: 'Flights',
    subtitle: 'Air travel bonuses',
    svgPath: 'assets/svg/aeroplane.svg',
    lbColor: Color(0xFF9CFFC3),
    rtColor: Color(0xFF9FDCFF),
  ),
  BonusSection(
    title: 'Grocery',
    subtitle: 'Grocery bonuses',
    svgPath: 'assets/svg/cutlery.svg',
    lbColor: Color(0xFFB44141),
    rtColor: Color(0xFFFF9F9F),
  ),
];
