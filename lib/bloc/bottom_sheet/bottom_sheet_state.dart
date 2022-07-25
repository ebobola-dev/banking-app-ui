import 'package:equatable/equatable.dart';

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

class BottomSheetState extends Equatable {
  static const minHeight = .4;
  static const maxHeight = .96;
  static const initHeight = .6;

  final double size;
  const BottomSheetState({
    this.size = initHeight,
  });

  @override
  List<Object> get props => [size];

  bool get isMin => size.toPrecision(2) == minHeight;
  bool get isMiddle => size.toPrecision(2) == initHeight;
  bool get isMax => size.toPrecision(2) == maxHeight;
}
