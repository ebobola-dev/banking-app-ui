import 'package:baking_app_ui/models/operation.dart';
import 'package:equatable/equatable.dart';

class OperationsState extends Equatable {
  final List<Operation> operations;
  const OperationsState({
    required this.operations,
  });

  @override
  List<Object> get props => [operations];
}
