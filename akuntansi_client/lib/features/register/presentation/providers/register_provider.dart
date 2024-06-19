import 'package:akuntansi_client/core/presentation/providers/form_provider.dart';
import 'package:akuntansi_client/features/register/domain/usecases/do_register.dart';
import 'package:akuntansi_client/features/register/presentation/providers/register_state.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends FormProvider {
  final DoRegister doRegister;

  RegisterProvider({
    required this.doRegister,
  });

  Stream<RegisterState> doRegisterApi(
      {required BuildContext ctx,
      required String namaUsaha,
      required String alamat,
      required String email,
      required String password}) async* {
    yield RegisterLoading();

    final result = await doRegister.call(namaUsaha, alamat, email, password);
    yield* result.fold((statusCode) async* {
      yield RegisterFailure(failure: statusCode.message);
    }, (result) async* {
      yield RegisterSuccess(data: result);
    });
  }
}
