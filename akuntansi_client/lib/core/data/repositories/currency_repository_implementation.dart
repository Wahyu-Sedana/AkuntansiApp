import 'package:dartz/dartz.dart';

import '../../domains/entities/currency.dart';
import '../../domains/repositories/currency_repository.dart';
import '../../error/failure.dart';
import '../../networks/network_info.dart';
import '../datasources/currency_datasource.dart';

class CurrencyRepositoryImplementation implements CurrencyRepository {
  final CurrencyDataSource dataSource;
  final NetworkInfo networkInfo;

  CurrencyRepositoryImplementation({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Currency>> getCurrency() async {
    if (!await networkInfo.isConnected) {
      return const Left(ConnectionFailure());
    }

    try {
      final response = await dataSource.getCurrency();
      return Right(response);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
