abstract class PageEvent {}

class ChangePageEvent extends PageEvent {
  final int newPage;
  ChangePageEvent(this.newPage);
}
