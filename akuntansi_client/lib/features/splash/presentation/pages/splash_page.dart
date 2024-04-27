import 'dart:async';

import 'package:akuntansi_client/features/login/presentation/pages/login_page.dart';
import 'package:akuntansi_client/features/splash/presentation/providers/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/providers/currency_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 2), () async {
        context.read<SplashProvider>().fetchCurrency().listen((state) async {
          switch (state.runtimeType) {
            case CurrencyLoading:
              break;
            case CurrencyLoaded:
              Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (route) => false);
              break;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('My Akuntan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          CircularProgressIndicator()
        ],
      )),
    );
  }
}
