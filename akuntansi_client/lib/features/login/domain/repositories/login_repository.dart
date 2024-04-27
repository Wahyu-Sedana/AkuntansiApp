import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/login_response.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginDataModel?>> doLogin(String email, String password);
}
