import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_textfield.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimens.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/injection.dart';
import '../../../../core/utils/session.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/validation.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../providers/login_provider.dart';
import '../providers/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  void submit() {
    final provider = context.read<LoginProvider>();
    provider.doLoginApi().listen((state) async {
      switch (state.runtimeType) {
        case LoginLoading:
          showLoading();
          break;
        case LoginFailure:
          final msg = (state as LoginFailure).failure;
          dismissLoading();
          showToast(message: msg);
          break;
        case LoginSuccess:
          dismissLoading();
          final session = locator<Session>();
          session.setLoggedIn = true;
          showToast(message: "Successfully logged in");
          Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, _) => Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: sizeMedium,
          ),
          child: Column(
            children: [
              CustomTextField(
                title: "Email",
                controller: provider.emailController,
                inputType: TextInputType.emailAddress,
                isError: provider.emailError,
                fieldValidator: ValidationHelper(
                  isError: (bool value) => provider.setEmailError = value,
                  typeField: TypeField.email,
                ).validate(),
              ),
              mediumVerticalSpacing(),
              CustomTextField(
                title: "password",
                controller: provider.passwordController,
                inputType: TextInputType.visiblePassword,
                isSecure: true,
                isError: provider.passwordError,
                fieldValidator: ValidationHelper(
                  isError: (bool value) => provider.setPasswordError = value,
                  typeField: TypeField.password,
                ).validate(),
              ),
              largeVerticalSpacing(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.pushNamed(
              //           context,
              //           ForgotPasswordPage.routeName,
              //         );
              //       },
              //       child: Padding(
              //         padding: const EdgeInsets.only(bottom: 20.0),
              //         child: Text(
              //           appLoc.forgotPassword,
              //           style: forgotPasStyle,
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              CustomButton(
                  text: Text(
                    "SIGN IN",
                    style: txtButtonStyle,
                  ),
                  event: () async {
                    if (provider.formKey.currentState!.validate()) {
                      submit();
                    }
                  },
                  bgColor: primaryDarkColor)
            ],
          ),
        ),
      ),
    );
  }
}
