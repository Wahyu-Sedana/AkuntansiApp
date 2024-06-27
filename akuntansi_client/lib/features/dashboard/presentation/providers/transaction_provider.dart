import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/core/utils/session.dart';
import 'package:akuntansi_client/features/dashboard/domain/usecases/transaction_usecase.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helper.dart';
import '../../data/models/transaction_models.dart';

class TransactionProvider with ChangeNotifier {
  final TransactionUseCaseImplementation transactionUseCaseImplementation;

  TransactionProvider({required this.transactionUseCaseImplementation});

  List<TransactionModel>? _dataTransactions;
  bool _isSaldoVisible = false;
  bool _isMakeRequest = true;
  int? _totalSaldo;
  int? _totalPemasukan;
  int? _totalPengeluaran;

  int? get totalSaldo => _totalSaldo;
  int? get totalPemasukan => _totalPemasukan;
  int? get totalPengeluaran => _totalPengeluaran;

  bool get isSaldoVisible => _isSaldoVisible;
  bool get isMakeRequest => _isMakeRequest;

  void toggleSaldoVisibility() {
    _isSaldoVisible = !_isSaldoVisible;
    notifyListeners();
  }

  void updateSaldo(val) {
    _totalSaldo = val;
    notifyListeners();
  }

  void updatePemasukan(val) {
    _totalPemasukan = val;
    notifyListeners();
  }

  void updatePengeluaran(val) {
    _totalPengeluaran = val;
    notifyListeners();
  }

  set setDataTransaction(val) {
    _dataTransactions = val;
    notifyListeners();
  }

  List<TransactionModel>? get dataTransaction => _dataTransactions;

  Future<void> getTransactions() async {
    try {
      final session = locator<Session>();
      if (_isMakeRequest) {
        final result = await transactionUseCaseImplementation.callSaldo(int.parse(session.userId));
        result.fold(
          (failure) {
            logMe("error");
            print(failure.message);
            logMe(failure);
            throw Exception(failure.message);
          },
          (data) {
            _totalSaldo = data.totalSaldo ?? 0;
            _totalPemasukan = data.totalPemasukan ?? 0;
            _totalPengeluaran = data.totalPengeluaran ?? 0;
            setDataTransaction = data.transactionModel;
            _isMakeRequest = false;
            print('total pemasukan: ${totalPemasukan}');
            notifyListeners();
          },
        );
      }
    } catch (e) {
      _isMakeRequest = false;
      logMe(e);
    }
  }
}
