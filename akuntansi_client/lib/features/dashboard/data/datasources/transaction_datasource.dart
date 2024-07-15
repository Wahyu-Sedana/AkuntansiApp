import 'package:akuntansi_client/core/utils/helper.dart';
import 'package:akuntansi_client/features/dashboard/data/models/kategori_models.dart';
import 'package:akuntansi_client/features/dashboard/data/models/transaction_models.dart';
import 'package:dio/dio.dart';

abstract class TransactionDataSource {
  Future<List<TransactionModel>> getTransaction(int userId);
  Future<TransactionResponseModel> getTotalSaldo(int userId);
  Future<TransactionResponseModel> addTransaction(
      int idKategori, int jumlah, String tanggal, String catatan);
  Future<KategoriResponseModel> getKategori(int userId);
}

class TransactionDataSourceImplementation implements TransactionDataSource {
  final Dio dio;
  TransactionDataSourceImplementation({required this.dio});

  @override
  Future<List<TransactionModel>> getTransaction(int userId) async {
    String url = 'transaction';
    try {
      final response = await dio.post(
        url,
        data: {'id_user': userId},
      );
      final model = TransactionResponseModel.fromJson(response.data);
      return model.transactionModel;
    } catch (e) {
      logMe(e);
      rethrow;
    }
  }

  @override
  Future<KategoriResponseModel> getKategori(int userId) async {
    String url = 'category';
    try {
      final response = await dio.post(
        url,
        data: {'id_user': userId},
      );
      final model = KategoriResponseModel.fromJson(response.data);
      return model;
    } catch (e) {
      logMe(e);
      rethrow;
    }
  }

  @override
  Future<TransactionResponseModel> addTransaction(
      int idKategori, int jumlah, String tanggal, String catatan) async {
    String url = 'transaction/add';
    Map<String, dynamic> result = {
      'id_kategori': idKategori,
      'jumlah': jumlah,
      'tanggal': tanggal,
      'catatan': catatan,
    };
    try {
      final response = await dio.post(
        url,
        data: result,
      );
      final model = TransactionResponseModel.fromJson(response.data);
      return model;
    } catch (e) {
      logMe(e);
      rethrow;
    }
  }

  @override
  Future<TransactionResponseModel> getTotalSaldo(int userId) async {
    String url = 'transaction';
    try {
      final response = await dio.post(
        url,
        data: {'id_user': userId},
      );
      final model = TransactionResponseModel.fromJson(response.data);
      return model;
    } catch (e) {
      logMe(e);
      rethrow;
    }
  }
}
