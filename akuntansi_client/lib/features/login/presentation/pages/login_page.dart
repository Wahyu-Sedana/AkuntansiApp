import 'package:akuntansi_client/core/utils/colors.dart';
import 'package:akuntansi_client/core/utils/styles.dart';
import 'package:akuntansi_client/features/login/presentation/providers/login_provider.dart';
import 'package:akuntansi_client/features/login/presentation/widgets/LoginForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/injection.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<LoginProvider>(),
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: ListView(
            children: [
              AspectRatio(
                aspectRatio: 5 / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: Text(
                        "SIGN IN",
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),
                    ),
                  ],
                ),
              ),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
