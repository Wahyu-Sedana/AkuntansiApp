import 'package:akuntansi_client/features/register/data/datasources/register_datasource.dart';
import 'package:akuntansi_client/features/register/data/models/register_reponse.dart';
import 'package:akuntansi_client/features/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/networks/network_info.dart';
import '../../../../core/utils/helper.dart';

class RegistrationRepostitoryImplementation implements RegisterRepository {
  final RegisterDataSource dataSource;
  final NetworkInfo networkInfo;
  RegistrationRepostitoryImplementation(this.networkInfo, {required this.dataSource});

  @override
  Future<Either<Failure, RegisterResponseModel>> doRegister(
      String namaUsaha, String alamat, String email, String password) async {
    if (!await networkInfo.isConnected) {
      return const Left(
          ConnectionFailure(message: "Connected to network not connected to the server"));
    }
    try {
      final data = await dataSource.doRegister(namaUsaha, alamat, email, password);
      return Right(data);
    } on DioError catch (e) {
      logMe("Failure Register repository ${e.toString()}");
      return const Left(ServerFailure(message: "Error while register repository"));
    }
  }
}
