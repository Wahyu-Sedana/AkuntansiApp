import 'package:akuntansi_client/core/utils/colors.dart';
import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/core/utils/styles.dart';
import 'package:akuntansi_client/features/register/presentation/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/register_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<RegisterProvider>(),
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: ListView(
            children: [
              AspectRatio(
                aspectRatio: 12 / 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 0,
                      child: Text(
                        "SIGN UP",
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),
                    )
                  ],
                ),
              ),
              const RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
