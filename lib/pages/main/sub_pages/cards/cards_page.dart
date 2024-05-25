import 'package:baking_app_ui/cards/bonus_section_card.dart';
import 'package:baking_app_ui/global_widgets/gradient_text.dart';
import 'package:baking_app_ui/global_widgets/header.dart';
import 'package:baking_app_ui/models/bonus_section.dart';
import 'package:baking_app_ui/pages/main/sub_pages/cards/widgets/bank_card_images.dart';
import 'package:baking_app_ui/pages/main/widgets/bottom_sheet.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardsSubPage extends StatefulWidget {
  const CardsSubPage({super.key});

  @override
  State<CardsSubPage> createState() => _CardsSubPageState();
}

class _CardsSubPageState extends State<CardsSubPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MyBottomSheet(
        screenHeight: MediaQuery.of(context).size.height,
        animationController: _animationController,
        child: ListView(
          shrinkWrap: true,
          children: List.generate(
            bonusSections.length,
            (index) => BonusSectionCard(section: bonusSections[index]),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(ThemeConfig.defaultPadding),
          controller: _scrollController,
          child: Column(
            children: [
              Header(
                leftWidget: Text(
                  'Cards',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                rightWidget: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/svg/question.svg',
                  ),
                  splashRadius: 28.0,
                ),
              ),
              const SizedBox(height: 30),
              BankCardImages(animationController: _animationController),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientText(
                    text: 'Ultimate',
                    style: Theme.of(context).textTheme.displayLarge,
                    gradient: const LinearGradient(colors: [
                      Color(0xFF8E6BAE),
                      Color(0xFFFCDACF),
                      Color(0xFFFF827B),
                    ]),
                  ),
                  Text(' Card',
                      style: Theme.of(context).textTheme.displayLarge),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
