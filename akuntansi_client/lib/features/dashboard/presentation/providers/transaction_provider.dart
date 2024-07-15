import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/core/utils/session.dart';
import 'package:akuntansi_client/features/dashboard/data/models/kategori_models.dart';
import 'package:akuntansi_client/features/dashboard/domain/usecases/transaction_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helper.dart';
import '../../data/models/transaction_models.dart';

class TransactionProvider with ChangeNotifier {
  final TransactionUseCaseImplementation transactionUseCaseImplementation;

  TransactionProvider({required this.transactionUseCaseImplementation});

  List<TransactionModel>? _dataTransactions;
  List<Kategori>? _dataKategori;
  Kategori? _selectedKategori;
  bool _isSaldoVisible = false;
  bool _isMakeRequest = true;
  bool _isMakeRequestKategori = true;
  int? _totalSaldo;
  int? _totalPemasukan;
  int? _totalPengeluaran;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _dataJumlahController = TextEditingController();
  final TextEditingController _dataCatatanController = TextEditingController();
  final TextEditingController _dataTanggalController = TextEditingController();

  int? get totalSaldo => _totalSaldo;
  int? get totalPemasukan => _totalPemasukan;
  int? get totalPengeluaran => _totalPengeluaran;

  final _formKey = GlobalKey<FormState>();
  bool _dataKategoriError = false;
  bool _dataJumlahError = false;
  bool _dataTanggalError = false;
  bool _dataCatatanError = false;

  bool get isSaldoVisible => _isSaldoVisible;
  bool get isMakeRequest => _isMakeRequest;
  bool get isMakeRequestKateogori => _isMakeRequestKategori;

  set setDataKategori(bool val) {
    _dataKategoriError = val;
    notifyListeners();
  }

  set setDataJumlah(bool val) {
    _dataJumlahError = val;
    notifyListeners();
  }

  set setDataTanggal(bool val) {
    _dataTanggalError = val;
    notifyListeners();
  }

  set setDataCatatan(bool val) {
    _dataCatatanError = val;
    notifyListeners();
  }

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

  set setDataListKategori(val) {
    _dataKategori = val;
    notifyListeners();
  }

  set setSelectedKategori(val) {
    _selectedKategori = val;
    notifyListeners();
  }

  GlobalKey<FormState> get formKey => _formKey;

  bool get dataKategoriError => _dataKategoriError;
  bool get dataJumlahError => _dataJumlahError;
  bool get dataTanggalError => _dataTanggalError;
  bool get dataCatatanError => _dataCatatanError;

  TextEditingController get dataJumlahController => _dataJumlahController;
  TextEditingController get dataCatatanController => _dataCatatanController;
  TextEditingController get dataTanggalController => _dataTanggalController;

  List<TransactionModel>? get dataTransaction => _dataTransactions;
  List<Kategori>? get dataKategori => _dataKategori;
  Kategori? get selectedKategori => _selectedKategori;

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

  Future<void> getKategoriData() async {
    try {
      if (_isMakeRequestKategori) {
        final session = locator<Session>();
        final result =
            await transactionUseCaseImplementation.callKategori(int.parse(session.userId));
        result.fold(
          (failure) {
            logMe("error");
            print(failure.message);
            logMe(failure);
            throw Exception(failure.message);
          },
          (data) {
            setDataListKategori = data.data;
            _isMakeRequestKategori = false;
            notifyListeners();
          },
        );
      }
    } catch (e) {
      _isMakeRequestKategori = false;
      logMe(e);
    }
  }

  Future<void> submitTransaction() async {
    print("value dari selected kategori ${_selectedKategori!.idKategori}");
    try {
      final result = await transactionUseCaseImplementation.callAddTransaction(
          _selectedKategori!.idKategori!,
          int.parse(dataJumlahController.text),
          dataTanggalController.text,
          dataCatatanController.text);
      // print('hasil form data: $formData');

      result.fold(
        (failure) {
          logMe("error");
          print(failure.message);
          logMe(failure);
          throw Exception(failure.message);
        },
        (success) async {
          clearFields();
          await getTransactions();
        },
      );
    } catch (e) {
      logMe(e);
    }
  }

  void clearFields() {
    _dataJumlahController.clear();
    _dataTanggalController.clear();
    _dataCatatanController.clear();
    notifyListeners();
  }
}
