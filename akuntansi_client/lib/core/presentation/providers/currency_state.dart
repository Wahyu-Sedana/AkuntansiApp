import 'package:equatable/equatable.dart';

import '../../domains/entities/currency.dart';
import '../../error/failure.dart';

abstract class CurrencyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurrencyLoading extends CurrencyState {}

class CurrencyLoaded extends CurrencyState {
  final Currency data;

  CurrencyLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class CurrencyFailure extends CurrencyState {
  final Failure failure;

  CurrencyFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
