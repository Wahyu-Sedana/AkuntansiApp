import 'package:akuntansi_client/features/dashboard/data/models/transaction_models.dart';
import 'package:equatable/equatable.dart';

abstract class TransactionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TransactionLoading extends TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<TransactionModel> data;
  TransactionLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class TransactionSaldoLoaded extends TransactionState {
  final TransactionResponseModel data;
  TransactionSaldoLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class TransactionFailure extends TransactionState {
  final String failure;

  TransactionFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
