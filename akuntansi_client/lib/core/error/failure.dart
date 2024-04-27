import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int? code;
  final String message;

  const Failure({this.message = '', this.code});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({int? code, String? message}) : super(message: message ?? "", code: code);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({String? message}) : super(message: message ?? "");
}

class CacheFailure extends Failure {}
