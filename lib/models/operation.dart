import 'package:baking_app_ui/models/operation_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Operation extends Equatable {
  final OperationType? operationType;
  final String copmpanyName;
  final bool negative;
  final String amount;
  final String stringTime;
  final String svgPath;
  final Color lbColor;
  final Color rtColor;

  const Operation({
    this.operationType,
    required this.copmpanyName,
    required this.negative,
    required this.amount,
    required this.stringTime,
    required this.svgPath,
    required this.lbColor,
    required this.rtColor,
  });

  @override
  List<Object> get props => [
        copmpanyName,
        negative,
        amount,
        stringTime,
        svgPath,
        lbColor,
        rtColor,
      ];
}

const List<Operation> operations = [
  Operation(
    copmpanyName: 'Accruals',
    negative: false,
    amount: '+ \$2,100',
    stringTime: '8:01 AM',
    svgPath: 'assets/svg/briefcase.svg',
    lbColor: Color(0xFFC79CFF),
    rtColor: Color(0xFF9FBFFF),
  ),
  Operation(
    operationType: OperationTypes.entertainment,
    copmpanyName: 'Taxi',
    negative: true,
    amount: '- \$26,49',
    stringTime: '5:43 AM',
    svgPath: 'assets/svg/car.svg',
    lbColor: Color(0xFFFFFB9C),
    rtColor: Color(0xFFFFB69F),
  ),
  Operation(
    operationType: OperationTypes.flights,
    copmpanyName: 'Flights',
    negative: true,
    amount: '- \$84',
    stringTime: 'Friday',
    svgPath: 'assets/svg/aeroplane.svg',
    lbColor: Color(0xFFFF9C9C),
    rtColor: Color(0xFFFF83CD),
  ),
  Operation(
    operationType: OperationTypes.entertainment,
    copmpanyName: 'Shopping',
    negative: true,
    amount: '- \$145,56',
    stringTime: 'Wednesday',
    svgPath: 'assets/svg/shopping-bag.svg',
    lbColor: Color(0xFF9CFFD5),
    rtColor: Color(0xFF83CBFF),
  ),
  Operation(
    operationType: OperationTypes.entertainment,
    copmpanyName: 'Delivery',
    negative: true,
    amount: '- \$4,99',
    stringTime: 'Wednesday',
    svgPath: 'assets/svg/shopping-bag.svg',
    lbColor: Color(0xFFD99CFF),
    rtColor: Color(0xFFFFD0F2),
  ),
  Operation(
    operationType: OperationTypes.entertainment,
    copmpanyName: 'Taxi',
    negative: true,
    amount: '- \$14,87',
    stringTime: 'Monday',
    svgPath: 'assets/svg/car.svg',
    lbColor: Color(0xFFFFFB9C),
    rtColor: Color(0xFFFFB69F),
  ),
  Operation(
    operationType: OperationTypes.entertainment,
    copmpanyName: 'Shopping',
    negative: true,
    amount: '- \$26,03',
    stringTime: 'Last week',
    svgPath: 'assets/svg/shopping-bag.svg',
    lbColor: Color(0xFF9CFFD5),
    rtColor: Color(0xFF83CBFF),
  ),
  Operation(
    operationType: OperationTypes.bonuses,
    copmpanyName: 'Bonuses',
    negative: false,
    amount: '+ \$4,99',
    stringTime: 'Last week',
    svgPath: 'assets/svg/gift.svg',
    lbColor: Color(0xFFFF9CDD),
    rtColor: Color(0xFF86FF83),
  ),
  Operation(
    operationType: OperationTypes.grocery,
    copmpanyName: 'Restaurants',
    negative: true,
    amount: '- \$234,50',
    stringTime: 'Two weeks ago',
    svgPath: 'assets/svg/cutlery.svg',
    lbColor: Color(0xFFF85757),
    rtColor: Color(0xFFFF838B),
  ),
  Operation(
    operationType: OperationTypes.grocery,
    copmpanyName: 'Restaurants',
    negative: true,
    amount: '- \$1578,00',
    stringTime: 'Two weeks ago',
    svgPath: 'assets/svg/cutlery.svg',
    lbColor: Color(0xFFF85757),
    rtColor: Color(0xFFFF838B),
  ),
];
