import 'package:baking_app_ui/bloc/nav_bar/nav_bar_bloc.dart';
import 'package:baking_app_ui/bloc/nav_bar/nav_bar_event.dart';
import 'package:baking_app_ui/bloc/page/page_event.dart';
import 'package:baking_app_ui/bloc/page/page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  final NavBarBloc navBarBloc;
  PageBloc({required this.navBarBloc}) : super(const PageState(page: 0)) {
    on<ChangePageEvent>((event, emit) {
      if (event.newPage == 3) return;
      emit(PageState(page: event.newPage, fromScroll: event.fromScroll));
      navBarBloc.add(ShowNavBarEvent());
    });
  }
}
