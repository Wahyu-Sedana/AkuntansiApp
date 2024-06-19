import 'package:dio/dio.dart';

import '../models/register_reponse.dart';

abstract class RegisterDataSource {
  Future<RegisterResponseModel> doRegister(
      String namaUsaha, String alamat, String email, String password);
}

class RegisterDataSourceImplementation implements RegisterDataSource {
  final Dio dio;

  RegisterDataSourceImplementation({required this.dio});

  @override
  Future<RegisterResponseModel> doRegister(
      String namaUsaha, String alamat, String email, String password) async {
    String url = 'register';

    Map<String, dynamic> data = {
      'namaUsaha': namaUsaha,
      'alamat': alamat,
      'email': email,
      'password': password
    };

    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      final model = RegisterResponseModel.fromJson(response.data);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
