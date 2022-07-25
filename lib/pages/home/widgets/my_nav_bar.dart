import 'dart:ui';

import 'package:baking_app_ui/bloc/bottom_sheet/bottom_sheet_bloc.dart';
import 'package:baking_app_ui/bloc/bottom_sheet/bottom_sheet_state.dart';
import 'package:baking_app_ui/bloc/page/page_bloc.dart';
import 'package:baking_app_ui/bloc/page/page_state.dart';
import 'package:baking_app_ui/pages/home/widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(35.0);
    final smallLineWidth =
        (MediaQuery.of(context).size.width - 2 - 15 * 2) * .25;
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
        child: BlocBuilder<BottomSheetBloc, BottomSheetState>(
            buildWhen: (previous, current) => previous.isMax != current.isMax,
            builder: (context, bottomSheetState) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: bottomSheetState.isMax ? 5 : 70,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: Colors.white.withOpacity(.05),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        4,
                        (index) => NavBarItem(
                          index: index,
                          activeColor: Theme.of(context).primaryColor,
                          inactiveColor: Theme.of(context)
                              .iconTheme
                              .color!
                              .withOpacity(.3),
                        ),
                      ),
                    ),
                    BlocBuilder<PageBloc, PageState>(
                      builder: (context, pageState) {
                        return AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          left: pageState.page * smallLineWidth,
                          bottom: bottomSheetState.isMax ? 0 : -5,
                          child: Container(
                            width: smallLineWidth,
                            height: 5.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
