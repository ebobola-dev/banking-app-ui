import 'dart:developer';

import 'package:baking_app_ui/bloc/operations/operations_bloc.dart';
import 'package:baking_app_ui/bloc/operations/operations_state.dart';
import 'package:baking_app_ui/cards/operation_card.dart';
import 'package:baking_app_ui/global_widgets/circle_down_button.dart';
import 'package:baking_app_ui/global_widgets/header.dart';
import 'package:baking_app_ui/pages/main/sub_pages/home/widgets/bank_card_image.dart';
import 'package:baking_app_ui/pages/main/widgets/bottom_sheet.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSubPage extends StatefulWidget {
  const HomeSubPage({super.key});

  @override
  State<HomeSubPage> createState() => _HomeSubPageState();
}

class _HomeSubPageState extends State<HomeSubPage>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  final _operationListKey = GlobalKey<AnimatedListState>();
  late final AnimationController _animationController;

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
        animationController: _animationController,
        screenHeight: MediaQuery.of(context).size.height,
        child: BlocBuilder<OperationsBloc, OperationsState>(
          builder: (context, operationState) => AnimatedList(
            key: _operationListKey,
            shrinkWrap: true,
            initialItemCount: operationState.operations.length,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: OperationCard(
                  operation: operationState.operations[index],
                  onRemove: () {
                    _operationListKey.currentState!.removeItem(
                      index,
                      (_, animation) {
                        return SizeTransition(
                          sizeFactor: animation,
                          child: OperationCard(
                            operation: operationState.operations[index],
                            onRemove: () {},
                          ),
                        );
                      },
                      duration: const Duration(milliseconds: 150),
                    );
                  },
                ),
              );
            },
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
                leftWidget: Row(
                  children: [
                    Text(
                      '\$14,095',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(width: 10),
                    CircleDownButton(
                      onTap: () {
                        log('tap on money');
                      },
                    ),
                  ],
                ),
                rightWidget: const CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ),
              const SizedBox(height: 50),
              BankCardImage(animationController: _animationController),
            ],
          ),
        ),
      ),
    );
  }
}
