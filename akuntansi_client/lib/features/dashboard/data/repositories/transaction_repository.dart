import 'package:akuntansi_client/core/error/failure.dart';
import 'package:akuntansi_client/core/networks/network_info.dart';
import 'package:akuntansi_client/features/dashboard/data/datasources/transaction_datasource.dart';
import 'package:akuntansi_client/features/dashboard/data/models/kategori_models.dart';
import 'package:akuntansi_client/features/dashboard/data/models/transaction_models.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/helper.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionModel>>> getTransaction(int userId);
  Future<Either<Failure, TransactionResponseModel>> getTotalSaldo(int userId);
  Future<Either<Failure, KategoriResponseModel>> getKategori(int userId);
  Future<Either<Failure, TransactionResponseModel>> addTransaction(FormData formData);
}

class TransactionRepositoryImplementation implements TransactionRepository {
  final TransactionDataSource getTransactionDataSource;
  final NetworkInfo networkInfo;

  TransactionRepositoryImplementation(
      {required this.getTransactionDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<TransactionModel>>> getTransaction(int userId) async {
    if (!await networkInfo.isConnected) {
      return const Left(ConnectionFailure(
          message:
              "Koneksi internet tidak stabil. Periksa lingkungan jaringan Anda atau coba mulai ulang aplikasi atau perangkat"));
    }
    try {
      final data = await getTransactionDataSource.getTransaction(userId);
      return Right(data);
    } on DioError catch (e) {
      logMe("Failure History repository ${e.toString()}");
      return const Left(ServerFailure(message: "Server tidak stabil. Silakan coba lagi nanti."));
    }
  }

  @override
  Future<Either<Failure, KategoriResponseModel>> getKategori(int userId) async {
    if (!await networkInfo.isConnected) {
      return const Left(ConnectionFailure(
          message:
              "Koneksi internet tidak stabil. Periksa lingkungan jaringan Anda atau coba mulai ulang aplikasi atau perangkat"));
    }
    try {
      final data = await getTransactionDataSource.getKategori(userId);
      return Right(data);
    } on DioError catch (e) {
      logMe("Failure History repository ${e.toString()}");
      return const Left(ServerFailure(message: "Server tidak stabil. Silakan coba lagi nanti."));
    }
  }

  @override
  Future<Either<Failure, TransactionResponseModel>> addTransaction(FormData formData) async {
    if (!await networkInfo.isConnected) {
      return const Left(ConnectionFailure(
          message:
              "Koneksi internet tidak stabil. Periksa lingkungan jaringan Anda atau coba mulai ulang aplikasi atau perangkat"));
    }
    try {
      final data = await getTransactionDataSource.addTransaction(formData);
      return Right(data);
    } on DioError catch (e) {
      logMe("Failure History repository ${e.toString()}");
      return const Left(ServerFailure(message: "Server tidak stabil. Silakan coba lagi nanti."));
    }
  }

  @override
  Future<Either<Failure, TransactionResponseModel>> getTotalSaldo(int userId) async {
    if (!await networkInfo.isConnected) {
      return const Left(ConnectionFailure(
          message:
              "Koneksi internet tidak stabil. Periksa lingkungan jaringan Anda atau coba mulai ulang aplikasi atau perangkat"));
    }
    try {
      final data = await getTransactionDataSource.getTotalSaldo(userId);
      return Right(data);
    } on DioError catch (e) {
      logMe("Failure History repository ${e.toString()}");
      return const Left(ServerFailure(message: "Server tidak stabil. Silakan coba lagi nanti."));
    }
  }
}
