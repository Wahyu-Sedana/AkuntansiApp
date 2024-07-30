import 'package:akuntansi_client/features/dashboard/data/models/kategori_models.dart';
import 'package:equatable/equatable.dart';

abstract class KategorinState extends Equatable {
  @override
  List<Object?> get props => [];
}

class KategorinLoading extends KategorinState {}

class KategorinInitial extends KategorinState {}

class KategorinLoaded extends KategorinState {
  final List<Kategori> data;
  KategorinLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class KategorinFailure extends KategorinState {
  final String failure;

  KategorinFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
