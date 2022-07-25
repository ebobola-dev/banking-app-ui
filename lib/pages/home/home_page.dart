import 'package:baking_app_ui/pages/home/widgets/bottom_sheet.dart';
import 'package:baking_app_ui/pages/home/widgets/header.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ThemeConfig.defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: 50),
                Image.asset(
                  "assets/images/bank-card.png",
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: const OperationsBottomSheet(),
    );
  }
}
