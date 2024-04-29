import 'package:akuntansi_client/core/error/failure.dart';
import 'package:akuntansi_client/features/register/data/models/register_reponse.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../repositories/register_repository.dart';

abstract class RegisterUseCase<Type> {
  Future<Either<Failure, RegisterResponseModel>> call(
      String username, String email, String password);
}

class DoRegister implements RegisterUseCase<String> {
  final RegisterRepository repository;

  DoRegister({required this.repository});

  @override
  Future<Either<Failure, RegisterResponseModel>> call(
      String username, String email, String password) async {
    final result = await repository.doRegister(username, email, password);
    return result.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }
}
