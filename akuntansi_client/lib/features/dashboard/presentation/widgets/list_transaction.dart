import 'package:akuntansi_client/features/dashboard/presentation/providers/state/transaction_state.dart';
import 'package:akuntansi_client/features/dashboard/presentation/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transaction_item.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(builder: (_, provider, __) {
      return StreamBuilder(
          stream: context.read<TransactionProvider>().getTransaction(),
          builder: (context, state) {
            switch (state.data.runtimeType) {
              case TransactionLoading:
                return const Center(child: CircularProgressIndicator());
              case TransactionFailure:
              case TransactionLoaded:
                final _data = (state.data as TransactionLoaded).data;
                return _data.length == 0
                    ? const Center(
                        child: Text(
                          'Tidak Ada Data',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
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
            }
            return Container();
          });
    });
  }
}
