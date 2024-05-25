import 'package:baking_app_ui/bloc/operations/operations_bloc.dart';
import 'package:baking_app_ui/bloc/operations/operations_event.dart';
import 'package:baking_app_ui/models/operation.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OperationCard extends StatelessWidget {
  final Operation operation;
  final VoidCallback onRemove;
  const OperationCard({
    super.key,
    required this.operation,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width - 2.0;
    return Slidable(
      key: ValueKey(operation),
      endActionPane: ActionPane(
        extentRatio: .32,
        motion: const ScrollMotion(),
        children: [
          GestureDetector(
            onTap: () {
              context
                  .read<OperationsBloc>()
                  .add(RemoveOperationEvent(operation));
              onRemove();
            },
            child: Container(
              height: double.infinity,
              width: cardWidth * .32,
              decoration: const BoxDecoration(
                color: Color(0xFFFF5959),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'remove',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
      // background: Align(
      //   alignment: Alignment.centerRight,
      //   child: BlocBuilder<DismissBloc, DismissState>(
      //       builder: (context, dismissState) {
      //     return Container(
      //       width: dismissState.dismissProgress * cardWidth,
      //       height: double.infinity,
      //       decoration: const BoxDecoration(
      //         color: Color(0xFFFF5959),
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(15.0),
      //           bottomLeft: Radius.circular(15.0),
      //         ),
      //       ),
      //       padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //       alignment: Alignment.centerLeft,
      //       child: Text(
      //         'remove',
      //         maxLines: 1,
      //         overflow: TextOverflow.clip,
      //         style: Theme.of(context).textTheme.headline5,
      //       ),
      //     );
      //   }),
      // ),
      child: SizedBox(
        width: cardWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 15.0,
          ),
          child: SizedBox(
            width: cardWidth - 30 * 2,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(13.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [operation.lbColor, operation.rtColor],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: SvgPicture.asset(
                    operation.svgPath,
                    colorFilter: const ColorFilter.mode(
                      Color(0xA6232323),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        operation.copmpanyName,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        operation.stringTime,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  operation.amount,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: operation.negative
                            ? ThemeConfig.negativeOperationColor
                            : ThemeConfig.positiveOperationColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
