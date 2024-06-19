import 'package:akuntansi_client/core/utils/colors.dart';
import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/core/utils/session.dart';
import 'package:akuntansi_client/features/dashboard/presentation/widgets/card_payment.dart';
import 'package:flutter/material.dart';

import '../widgets/list_transaction.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const routeName = "/dashboard";

  get pemasukanList => null;

  get pengeluaranList => null;

  @override
  Widget build(BuildContext context) {
    final session = locator<Session>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), // setengah dari ketinggian/wisata
                      image: const DecorationImage(
                        image: AssetImage('assets/people.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        session.namaUsaha,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Selamat datang ${session.namaUsaha}!',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.notifications,
                color: primaryDarkColor,
                size: 30,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Column(
              children: [
                CardPaymentWidget(),
                SizedBox(height: 20),
                TransactionListWidget(isPemasukan: true),
                TransactionListWidget(isPemasukan: false),
              ],
            ),
          ),
        ));
  }
}
