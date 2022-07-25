import 'package:baking_app_ui/bloc/page/page_bloc.dart';
import 'package:baking_app_ui/bloc/page/page_state.dart';
import 'package:baking_app_ui/pages/main/sub_pages/cards/cards_page.dart';
import 'package:baking_app_ui/pages/main/sub_pages/home/home_page.dart';
import 'package:baking_app_ui/pages/main/widgets/my_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _subPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PageBloc, PageState>(
      listener: (context, pageState) => _subPageController.animateToPage(
        pageState.page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _subPageController,
              children: const [
                HomeSubPage(),
                SizedBox(),
                CardsSubPage(),
                SizedBox(),
              ],
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
