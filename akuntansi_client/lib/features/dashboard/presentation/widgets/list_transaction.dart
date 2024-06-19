import 'package:akuntansi_client/core/utils/helper.dart';
import 'package:akuntansi_client/features/dashboard/data/models/transaction.dart';
import 'package:akuntansi_client/features/dashboard/presentation/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionListWidget extends StatelessWidget {
  final bool isPemasukan;

  const TransactionListWidget({required this.isPemasukan, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, saldoProvider, child) {
        List<TransactionModel> transactions =
            isPemasukan ? saldoProvider.pemasukanList : saldoProvider.pengeluaranList;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                isPemasukan ? 'Daftar Pemasukan' : 'Daftar Pengeluaran',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                TransactionModel transaction = transactions[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(transaction.description),
                      trailing: Text(
                        mergePriceTxt(transaction.amount.toStringAsFixed(2)),
                        style: TextStyle(
                          color: isPemasukan ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
