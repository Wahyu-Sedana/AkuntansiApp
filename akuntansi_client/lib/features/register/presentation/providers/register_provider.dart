import 'package:akuntansi_client/core/presentation/providers/form_provider.dart';
import 'package:akuntansi_client/features/register/domain/usecases/do_register.dart';
import 'package:akuntansi_client/features/register/presentation/providers/register_state.dart';
import 'package:akuntansi_client/features/register/presentation/widgets/register_form.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends FormProvider {
  final DoRegister doRegister;

  RegisterProvider({
    required this.doRegister,
  });

  Stream<RegisterState> doRegisterApi(
      {required BuildContext ctx,
      required String username,
      required String email,
      required String password}) async* {
    yield RegisterLoading();

    final data = FormData.fromMap({
      'username': username,
      'email': email,
      'password': password,
    });
    final result = await doRegister.call(username, email, password);
    yield* result.fold((statusCode) async* {
      yield RegisterFailure(failure: statusCode.message);
    }, (result) async* {
      yield RegisterSuccess(data: result);
    });
  }
}
