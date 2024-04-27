import 'package:dartz/dartz.dart';

import '../../error/failure.dart';
import '../entities/currency.dart';
import '../repositories/currency_repository.dart';

abstract class GetCurrencyUseCase<Type> {
  Future<Either<Failure, Currency>> call();
}

class GetCurrency implements GetCurrencyUseCase {
  CurrencyRepository repository;

  GetCurrency(this.repository);

  @override
  Future<Either<Failure, Currency>> call() async {
    return await repository.getCurrency();
  }
}
