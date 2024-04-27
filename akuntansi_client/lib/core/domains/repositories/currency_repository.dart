import 'package:dartz/dartz.dart';

import '../../error/failure.dart';
import '../entities/currency.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, Currency>> getCurrency();
}
