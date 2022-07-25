import 'package:baking_app_ui/models/operation.dart';

abstract class OperationsEvent {}

class RemoveOperationEvent extends OperationsEvent {
  Operation operation;
  RemoveOperationEvent(this.operation);
}
