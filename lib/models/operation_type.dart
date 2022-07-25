import 'package:equatable/equatable.dart';

class OperationType extends Equatable {
  final String title;
  final String subtitle;

  const OperationType({
    required this.title,
    required this.subtitle,
  });

  @override
  List<Object> get props => [title, subtitle];
}

class OperationTypes {
  static const entertainment = OperationType(
    title: 'Entertainment',
    subtitle: 'Increased cashback',
  );
  static const bonuses = OperationType(
    title: 'Bonuses',
    subtitle: 'More bonus categories',
  );
  static const flights = OperationType(
    title: 'Flights',
    subtitle: 'Air travel bonuses',
  );
  static const grocery = OperationType(
    title: 'Grocery',
    subtitle: 'Grocery bonuses',
  );
}
