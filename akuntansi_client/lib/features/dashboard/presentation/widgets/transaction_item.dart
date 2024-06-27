import 'package:flutter/material.dart';
import 'package:akuntansi_client/features/dashboard/data/models/transaction_models.dart';
import 'package:akuntansi_client/core/utils/helper.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel data;

  const TransactionItem({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        title: Text(data.catatan ?? ''),
        subtitle: Text(data.kategori ?? ''),
        trailing: Text(
          mergePriceTxt(data.jumlah.toString()),
          style: TextStyle(
            color: data.idJenis == 1 ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
