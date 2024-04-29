import 'package:akuntansi_client/features/login/presentation/pages/login_page.dart';
import 'package:akuntansi_client/features/register/presentation/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_textfield.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dimens.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/validation.dart';
import '../providers/register_state.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  void submit(
    String username,
    String email,
    String password,
  ) {
    final provider = context.read<RegisterProvider>();
    provider
        .doRegisterApi(ctx: context, username: username, email: email, password: password)
        .listen((state) async {
      switch (state.runtimeType) {
        case RegisterLoading:
          showLoading();
          break;
        case RegisterFailure:
          final msg = (state as RegisterFailure).failure;
          dismissLoading();
          showToast(message: msg);
          break;
        case RegisterSuccess:
          final data = (state as RegisterSuccess).data;
          dismissLoading();
          if (data!.success == true) {
            showToast(message: "Register Successful");
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          } else {
            if (data.message.toString().contains("email")) {
              showToast(message: "email already registered");
            } else {
              showToast(message: "Register Failed");
            }
          }

          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, provider, _) => Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: sizeMedium,
          ),
          child: Column(
            children: [
              CustomTextField(
                title: "Username",
                controller: provider.usernameController,
                inputType: TextInputType.name,
                isError: provider.usernameError,
                fieldValidator: ValidationHelper(
                  isError: (bool value) => provider.setUsernameError = value,
                  typeField: TypeField.username,
                ).validate(),
              ),
              mediumVerticalSpacing(),
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
              CustomButton(
                  text: Text(
                    "SIGN UP",
                    style: txtButtonStyle,
                  ),
                  event: () async {
                    if (provider.formKey.currentState!.validate()) {
                      submit(
                        provider.usernameController.text,
                        provider.emailController.text,
                        provider.passwordController.text,
                      );
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
