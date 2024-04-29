import 'package:akuntansi_client/features/register/data/models/register_reponse.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterResponseModel? data;
  RegisterSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

class RegisterFailure extends RegisterState {
  final String failure;

  RegisterFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
