import 'package:akuntansi_client/core/error/failure.dart';
import 'package:akuntansi_client/features/register/data/models/register_reponse.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterResponseModel>> doRegister(
      String namaUsaha, String alamat, String email, String password);
}
