import 'package:equatable/equatable.dart';

class PageState extends Equatable {
  final int page;
  final bool fromScroll;
  const PageState({required this.page, this.fromScroll = false});

  @override
  List<Object> get props => [page, fromScroll];
}
