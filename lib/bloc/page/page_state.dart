import 'package:equatable/equatable.dart';

class PageState extends Equatable {
  final int page;
  const PageState(this.page);

  @override
  List<Object> get props => [page];
}
