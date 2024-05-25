import 'dart:developer';

import 'package:baking_app_ui/global_widgets/circle_down_button.dart';
import 'package:baking_app_ui/models/bonus_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BonusSectionCard extends StatelessWidget {
  final BonusSection section;
  const BonusSectionCard({
    super.key,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width - 2.0;
    return SizedBox(
      width: cardWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 15.0,
        ),
        child: SizedBox(
          width: cardWidth - 30 * 2,
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [section.lbColor, section.rtColor],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: SvgPicture.asset(
                  section.svgPath,
                  colorFilter: const ColorFilter.mode(
                    Color(0xA6232323),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.title,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      section.subtitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              CircleDownButton(
                size: 36.0,
                onTap: () {
                  log('tap on ${section.title} section');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
