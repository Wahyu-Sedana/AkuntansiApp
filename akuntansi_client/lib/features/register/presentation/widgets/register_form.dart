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
  void submit(String namaUsaha, String alamat, String email, String password) {
    final provider = context.read<RegisterProvider>();
    provider
        .doRegisterApi(
            ctx: context, namaUsaha: namaUsaha, alamat: alamat, email: email, password: password)
        .listen((state) async {
      switch (state.runtimeType) {
        case RegisterLoading:
          showLoading();
          break;
        case RegisterFailure:
          final msg = (state as RegisterFailure).failure;
          showToast(message: msg);
          dismissLoading();
          break;
        case RegisterSuccess:
          final data = (state as RegisterSuccess).data;
          if (data!.status == 200) {
            showToast(message: "Register Successful");
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          } else if (data.status == 409) {
            showToast(message: "email already registered");
          } else {
            showToast(message: "Register Failed");
          }
          dismissLoading();
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
                title: "Nama Usaha",
                controller: provider.namaUsahaController,
                inputType: TextInputType.name,
                isError: provider.namaUsahaError,
                fieldValidator: ValidationHelper(
                  isError: (bool value) => provider.setnamaUsahaError = value,
                  typeField: TypeField.namaUsaha,
                ).validate(),
              ),
              mediumVerticalSpacing(),
              CustomTextField(
                title: "Alamat",
                controller: provider.alamatController,
                inputType: TextInputType.streetAddress,
                isError: provider.alamatError,
                fieldValidator: ValidationHelper(
                  isError: (bool value) => provider.setAlamatError = value,
                  typeField: TypeField.alamat,
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
                        provider.namaUsahaController.text,
                        provider.alamatController.text,
                        provider.emailController.text,
                        provider.passwordController.text,
                      );
                    }
                  },
                  bgColor: primaryDarkColor),
              largeVerticalSpacing(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        LoginPage.routeName,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Have an account? Sign In!",
                        style: forgotPasStyle,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
