import 'package:baking_app_ui/bloc/operations/operations_event.dart';
import 'package:baking_app_ui/bloc/operations/operations_state.dart';
import 'package:baking_app_ui/models/operation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OperationsBloc extends Bloc<OperationsEvent, OperationsState> {
  OperationsBloc() : super(const OperationsState(operations: operations)) {
    on<RemoveOperationEvent>((event, emit) {
      emit(OperationsState(
        operations: state.operations
            .where((operation) => operation != event.operation)
            .toList(),
      ));
    });
  }
}
