import 'dart:ui';

import 'package:baking_app_ui/bloc/nav_bar/nav_bar_bloc.dart';
import 'package:baking_app_ui/bloc/nav_bar/nav_bar_event.dart';
import 'package:baking_app_ui/config.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomSheet extends StatefulWidget {
  final Widget child;
  final double screenHeight;
  final AnimationController animationController;
  const MyBottomSheet({
    super.key,
    required this.animationController,
    required this.child,
    required this.screenHeight,
  });

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  final _sheetController = DraggableScrollableController();
  late double sizedBoxHeight;

  @override
  void initState() {
    final navBarBloc = context.read<NavBarBloc>();
    _sheetController.addListener(() {
      if (_sheetController.isAttached) {
        if (_sheetController.size >= BottomSheetHeights.max - .05) {
          navBarBloc.add(HideNavBarEvent());
        } else {
          navBarBloc.add(ShowNavBarEvent());
        }
      }
    });

    widget.animationController.addListener(() {
      if (widget.animationController.status == AnimationStatus.completed) {
        if (_sheetController.isAttached) {
          _sheetController.animateTo(
            BottomSheetHeights.middle,
            duration: const Duration(milliseconds: 600),
            curve: Config.mainCurve,
          );
        }
      }
    });

    sizedBoxHeight = widget.screenHeight * BottomSheetHeights.min - 47.0 - 2.0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        sizedBoxHeight =
            widget.screenHeight * _sheetController.size - 47.0 - 2.0;
      });
      _sheetController.addListener(() {
        setState(() {
          sizedBoxHeight =
              widget.screenHeight * _sheetController.size - 47.0 - 2.0;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _sheetController,
      minChildSize: BottomSheetHeights.min,
      maxChildSize: BottomSheetHeights.max,
      initialChildSize: BottomSheetHeights.min,
      expand: false,
      snap: true,
      snapSizes: const [
        BottomSheetHeights.min,
        BottomSheetHeights.middle,
        BottomSheetHeights.max,
      ],
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .secondaryHeaderColor
                          .withOpacity(.7),
                      border: Border.all(color: ThemeConfig.buttonColor),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 47.0,
                          width: double.infinity,
                          child: Align(
                            child: Container(
                              width: 50.0,
                              height: 7.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                color: const Color(0xFFfafafa).withOpacity(.1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizedBoxHeight,
                          child: widget.child,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
