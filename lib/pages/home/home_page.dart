import 'package:baking_app_ui/bloc/bottom_sheet/bottom_sheet_bloc.dart';
import 'package:baking_app_ui/pages/home/widgets/bottom_sheet.dart';
import 'package:baking_app_ui/pages/home/widgets/header.dart';
import 'package:baking_app_ui/pages/home/widgets/my_nav_bar.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomSheetBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              bottomSheet: const OperationsBottomSheet(),
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
            ),
            const Positioned(
              bottom: 50,
              left: 15,
              right: 15,
              child: MyNavBar(),
            ),
          ],
        ),
        // bottomSheet: const OperationsBottomSheet(),
        // bottomNavigationBar: SizedBox(
        //   height: 0,
        //   child: Stack(
        //     clipBehavior: Clip.none,
        //     children: const [
        //       Positioned(
        //         bottom: 50,
        //         left: 15,
        //         right: 15,
        //         child: MyNavBar(),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
