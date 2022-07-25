import 'dart:ui';

import 'package:baking_app_ui/bloc/operations/operations_bloc.dart';
import 'package:baking_app_ui/bloc/operations/operations_state.dart';
import 'package:baking_app_ui/cards/operation_card.dart';
import 'package:baking_app_ui/pages/home/widgets/my_nav_bar.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const minHeight = .4;
const maxHeight = .96;
const initHeight = .6;

class OperationsBottomSheet extends StatefulWidget {
  const OperationsBottomSheet({Key? key}) : super(key: key);

  @override
  State<OperationsBottomSheet> createState() => _OperationsBottomSheetState();
}

class _OperationsBottomSheetState extends State<OperationsBottomSheet> {
  final _sheetController = DraggableScrollableController();
  final _operationListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
      controller: _sheetController,
      minChildSize: minHeight,
      maxChildSize: maxHeight,
      initialChildSize: initHeight,
      snap: true,
      snapSizes: const [minHeight, initHeight, maxHeight],
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
                      color: Theme.of(context).secondaryHeaderColor,
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
                          height: screenSize.height * _sheetController.size -
                              47.0 -
                              2.0,
                          child: BlocBuilder<OperationsBloc, OperationsState>(
                            builder: (context, operationState) => AnimatedList(
                              key: _operationListKey,
                              shrinkWrap: true,
                              initialItemCount:
                                  operationState.operations.length,
                              itemBuilder: (context, index, animation) {
                                return SizeTransition(
                                  sizeFactor: animation,
                                  child: OperationCard(
                                    operation: operationState.operations[index],
                                    onRemove: () {
                                      _operationListKey.currentState!
                                          .removeItem(
                                        index,
                                        (_, animation) {
                                          return SizeTransition(
                                            sizeFactor: animation,
                                            child: OperationCard(
                                              operation: operationState
                                                  .operations[index],
                                              onRemove: () {},
                                            ),
                                          );
                                        },
                                        duration:
                                            const Duration(milliseconds: 150),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    bottom: 50.0,
                    left: 15.0,
                    right: 15.0,
                    child: MyNavBar(),
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
