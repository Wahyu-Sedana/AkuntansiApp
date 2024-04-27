import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/networks/network_info.dart';
import '../../../../core/utils/helper.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_datasource.dart';
import '../models/login_response.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final LoginDataSource dataSource;
  final NetworkInfo networkInfo;
  LoginRepositoryImplementation(this.networkInfo, {required this.dataSource});

  @override
  Future<Either<Failure, LoginDataModel?>> doLogin(String email, String password) async {
    if (!await networkInfo.isConnected) {
      return const Left(
          ConnectionFailure(message: "Connected to network not connected to the server"));
    }
    try {
      final data = await dataSource.doLogin(email, password);
      return Right(data);
    } on DioError catch (e) {
      logMe("Failure login repository ${e.toString()}");
      return const Left(ServerFailure(message: "Error while login repository"));
    }
  }
}
