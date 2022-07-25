abstract class BottomSheetEvent {}

class ChangeBottomSheetSizeEvent extends BottomSheetEvent {
  final double newSize;
  ChangeBottomSheetSizeEvent(this.newSize);
}
