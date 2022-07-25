import 'package:equatable/equatable.dart';

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

  bool get isMin => size == minHeight;
  bool get isMiddle => size == initHeight;
  bool get isMax => size == maxHeight;
}
