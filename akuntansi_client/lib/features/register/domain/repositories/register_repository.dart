import 'package:akuntansi_client/core/error/failure.dart';
import 'package:akuntansi_client/features/register/data/models/register_reponse.dart';
import 'package:akuntansi_client/features/register/domain/usecases/do_register.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterResponseModel>> doRegister(
      String username, String email, String password);
}
