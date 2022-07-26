abstract class PageEvent {}

class ChangePageEvent extends PageEvent {
  final int newPage;
  final bool fromScroll;
  ChangePageEvent({required this.newPage, this.fromScroll = false});
}
