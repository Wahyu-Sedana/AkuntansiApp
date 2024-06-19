import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/features/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:akuntansi_client/features/dashboard/presentation/providers/transaction_provider.dart';
import 'package:akuntansi_client/features/forgotPassword/presentation/pages/forgot_password_page.dart';
import 'package:akuntansi_client/features/home/presentation/pages/home_page.dart';
import 'package:akuntansi_client/features/login/presentation/pages/login_page.dart';
import 'package:akuntansi_client/features/register/presentation/pages/register_page.dart';
import 'package:akuntansi_client/features/splash/presentation/pages/splash_page.dart';
import 'package:akuntansi_client/features/splash/presentation/providers/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/history/presentation/pages/history_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashProvider>(
          create: (context) => locator<SplashProvider>(),
        ),
        ChangeNotifierProvider<DashboardProvider>(
          create: (context) => locator<DashboardProvider>(),
        ),
        ChangeNotifierProvider<TransactionProvider>(
            create: (context) => locator<TransactionProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
          '/forgotPassword': (context) => const ForgotPasswordPage(),
          '/profile': (context) => const ProfilePage(),
          '/dashboard': (context) => const DashboardPage(),
          '/history': (context) => const HistoryPage(),
        },
      ),
    );
  }
}
