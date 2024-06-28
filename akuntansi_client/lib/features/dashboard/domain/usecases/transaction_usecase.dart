import 'package:akuntansi_client/core/error/failure.dart';
import 'package:akuntansi_client/features/dashboard/data/models/kategori_models.dart';
import 'package:akuntansi_client/features/dashboard/data/models/transaction_models.dart';
import 'package:akuntansi_client/features/dashboard/data/repositories/transaction_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class TransactionUseCase {
  Future<Either<Failure, List<TransactionModel>>> call(int userId);
  Future<Either<Failure, TransactionResponseModel>> callSaldo(int userId);
  Future<Either<Failure, KategoriResponseModel>> callKategori(int userId);
  Future<Either<Failure, TransactionResponseModel>> callAddTransaction(FormData formData);
}

class TransactionUseCaseImplementation implements TransactionUseCase {
  final TransactionRepository transactionRepository;

  TransactionUseCaseImplementation({required this.transactionRepository});

  @override
  Future<Either<Failure, List<TransactionModel>>> call(int userId) async {
    final result = await transactionRepository.getTransaction(userId);
    return result.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failure, KategoriResponseModel>> callKategori(int userId) async {
    final result = await transactionRepository.getKategori(userId);
    return result.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failure, TransactionResponseModel>> callAddTransaction(FormData formData) async {
    final result = await transactionRepository.addTransaction(formData);
    return result.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failure, TransactionResponseModel>> callSaldo(int userId) async {
    final result = await transactionRepository.getTotalSaldo(userId);
    return result.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }
}
