import 'package:baking_app_ui/bloc/bottom_sheet/bottom_sheet_event.dart';
import 'package:baking_app_ui/bloc/bottom_sheet/bottom_sheet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  BottomSheetBloc() : super(const BottomSheetState()) {
    on<ChangeBottomSheetSizeEvent>((event, emit) {
      emit(BottomSheetState(size: event.newSize));
    });
  }
}
