import 'package:dio/dio.dart';

import '../../../../core/utils/injection.dart';
import '../../../../core/utils/session.dart';
import '../models/login_response.dart';

abstract class LoginDataSource {
  Future<LoginDataModel?> doLogin(String email, String password);
}

class LoginDataSourceImplementation implements LoginDataSource {
  final Dio dio;

  LoginDataSourceImplementation({required this.dio});

  @override
  Future<LoginDataModel?> doLogin(String email, String password) async {
    String url = 'login';
    FormData data = FormData.fromMap({'email': email, 'password': password});

    try {
      final response = await dio.post(
        url,
        data: data,
      );
      final model = LoginResponseModel.fromJson(response.data);
      final session = locator<Session>();
      if (model.data != null) {
        session.setUserId = model.data!.userId.toString();
        return model.data;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
