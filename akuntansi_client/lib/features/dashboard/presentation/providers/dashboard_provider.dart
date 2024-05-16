import 'package:flutter/material.dart';

class DashboardProvider with ChangeNotifier {
  double _totalSaldo = 5000000;
  double _totalPemasukan = 1500000;
  double _totalPengeluaran = 750000;
  bool _isSaldoVisible = false;

  double get totalSaldo => _totalSaldo;
  double get totalPemasukan => _totalPemasukan;
  double get totalPengeluaran => _totalPengeluaran;
  bool get isSaldoVisible => _isSaldoVisible;

  void toggleSaldoVisibility() {
    _isSaldoVisible = !_isSaldoVisible;
    notifyListeners();
  }

  void updateSaldo(double newSaldo) {
    _totalSaldo = newSaldo;
    notifyListeners();
  }

  void updatePemasukan(double newPemasukan) {
    _totalPemasukan = newPemasukan;
    notifyListeners();
  }

  void updatePengeluaran(double newPengeluaran) {
    _totalPengeluaran = newPengeluaran;
    notifyListeners();
  }
}
