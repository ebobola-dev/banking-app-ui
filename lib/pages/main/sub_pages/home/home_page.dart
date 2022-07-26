import 'dart:developer';

import 'package:baking_app_ui/bloc/operations/operations_bloc.dart';
import 'package:baking_app_ui/bloc/operations/operations_state.dart';
import 'package:baking_app_ui/cards/operation_card.dart';
import 'package:baking_app_ui/global_widgets/circle_down_button.dart';
import 'package:baking_app_ui/global_widgets/header.dart';
import 'package:baking_app_ui/pages/main/widgets/bottom_sheet.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSubPage extends StatefulWidget {
  const HomeSubPage({Key? key}) : super(key: key);

  @override
  State<HomeSubPage> createState() => _HomeSubPageState();
}

class _HomeSubPageState extends State<HomeSubPage> {
  final _operationListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: MyBottomSheet(
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
          child: Column(
            children: [
              Header(
                leftWidget: Row(
                  children: [
                    Text(
                      '\$14,095',
                      style: Theme.of(context).textTheme.headline1,
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
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x80d2bbaa),
                      offset: Offset(0, 5),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Image.asset("assets/images/bank-card.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
