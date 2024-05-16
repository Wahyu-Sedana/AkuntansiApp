import 'package:akuntansi_client/features/dashboard/data/models/transaction.dart';
import 'package:akuntansi_client/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:akuntansi_client/features/dashboard/presentation/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionListWidget extends StatelessWidget {
  final bool isPemasukan;

  const TransactionListWidget({required this.isPemasukan, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, provider, child) {
        List<TransactionModel> transactions =
            isPemasukan ? provider.pemasukanList : provider.pengeluaranList;

        return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isPemasukan ? 'Daftar Pemasukan' : 'Daftar Pengeluaran',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                ...transactions.map((transaction) {
                  return ListTile(
                    title: Text(transaction.description),
                    trailing: Text(
                      'Rp ${transaction.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: isPemasukan ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
