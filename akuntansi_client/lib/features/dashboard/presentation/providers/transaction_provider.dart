import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/core/utils/session.dart';
import 'package:akuntansi_client/features/dashboard/data/models/kategori_models.dart';
import 'package:akuntansi_client/features/dashboard/domain/usecases/transaction_usecase.dart';
import 'package:akuntansi_client/features/dashboard/presentation/providers/state/kategori_state.dart';
import 'package:akuntansi_client/features/dashboard/presentation/providers/state/transaction_state.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helper.dart';
import '../../data/models/transaction_models.dart';

class TransactionProvider with ChangeNotifier {
  final TransactionUseCaseImplementation transactionUseCaseImplementation;

  TransactionProvider({required this.transactionUseCaseImplementation});

  List<TransactionModel>? _dataTransactions;
  List<Kategori>? _dataKategori = [];
  Kategori? _selectedKategori;
  bool _isSaldoVisible = false;
  bool _isMakeRequestKategori = true;
  int? _totalSaldo;
  int? _totalPemasukan;
  int? _totalPengeluaran;

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

  Stream<TransactionState> getTransaction() async* {
    final session = locator<Session>();
    yield TransactionLoading();
    final result = await transactionUseCaseImplementation.callSaldo(int.parse(session.userId));
    yield* result.fold((failure) async* {
      logMe("error");
      logMe(failure);
      yield TransactionFailure(failure: failure.message);
    }, (data) async* {
      yield TransactionLoaded(data: data.transactionModel);
    });
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
            setDataListKategori = data;
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

      result.fold(
        (failure) {
          logMe("error");
          print(failure.message);
          logMe(failure);
          throw Exception(failure.message);
        },
        (success) {
          clearFields();
          getTransaction();
          notifyListeners();
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
