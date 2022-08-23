import 'package:baking_app_ui/bloc/nav_bar/nav_bar_event.dart';
import 'package:baking_app_ui/bloc/nav_bar/nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarBloc() : super(NavBarExpandedState()) {
    on<ShowNavBarEvent>((event, emit) => emit(NavBarExpandedState()));
    on<HideNavBarEvent>((event, emit) => emit(NavBarNotExpandedState()));
    on<ToggleNavBarEvent>((event, emit) => emit(
          state is NavBarNotExpandedState
              ? NavBarExpandedState()
              : NavBarNotExpandedState(),
        ));
  }
}
