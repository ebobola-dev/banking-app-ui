import 'package:baking_app_ui/pages/main/widgets/bottom_sheet.dart';
import 'package:baking_app_ui/pages/main/widgets/header.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';

class HomeSubPage extends StatelessWidget {
  const HomeSubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const OperationsBottomSheet(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(ThemeConfig.defaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 50),
              Image.asset("assets/images/bank-card.png"),
            ],
          ),
        ),
      ),
    );
  }
}
