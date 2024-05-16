import 'package:flutter/material.dart';

import '../../data/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  final List<TransactionModel> _pemasukanList = [
    TransactionModel(description: "Gaji", amount: 1000000),
    TransactionModel(description: "Bonus", amount: 300000),
    TransactionModel(description: "Penjualan", amount: 200000),
    TransactionModel(description: "Investasi", amount: 50000),
    TransactionModel(description: "Hadiah", amount: 200000),
  ];

  final List<TransactionModel> _pengeluaranList = [
    TransactionModel(description: "Makanan", amount: 200000),
    TransactionModel(description: "Transportasi", amount: 100000),
    TransactionModel(description: "Belanja", amount: 300000),
    TransactionModel(description: "Hiburan", amount: 100000),
    TransactionModel(description: "Tagihan", amount: 50000),
  ];

  List<TransactionModel> get pemasukanList => _pemasukanList;
  List<TransactionModel> get pengeluaranList => _pengeluaranList;
}
