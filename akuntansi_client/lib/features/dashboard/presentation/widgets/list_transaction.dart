import 'package:akuntansi_client/features/dashboard/presentation/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transaction_item.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, transactionProvider, child) {
        if (transactionProvider.isMakeRequest == true) {
          transactionProvider.getTransactions();
          return const Center(child: CircularProgressIndicator());
        }

        final _data = transactionProvider.dataTransaction;

        if (_data == null || _data.isEmpty) {
          return const Center(
            child: Text(
              'Tidak ada aktivitas!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: TransactionItem(data: _data[index]),
            );
          },
        );
      },
    );
  }
}
