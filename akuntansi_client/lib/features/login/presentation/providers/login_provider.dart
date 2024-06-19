import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/core/utils/session.dart';
import '../../../../core/presentation/providers/form_provider.dart';
import '../../../../core/utils/helper.dart';
import '../../domain/usecase/do_login.dart';
import 'login_state.dart';

class LoginProvider extends FormProvider {
  final DoLogin doLogin;

  LoginProvider({required this.doLogin});

  Stream<LoginState> doLoginApi() async* {
    yield LoginLoading();

    final loginResult = await doLogin.call(emailController.text, passwordController.text);
    final session = locator<Session>();
    yield* loginResult.fold((statusCode) async* {
      logMe(statusCode);
      yield LoginFailure(failure: statusCode.message);
    }, (result) async* {
      if (result != null) {
        yield LoginSuccess(data: result);
        session.setnamaUsaha = result.namaUsaha;
      } else {
        yield LoginFailure(failure: "Login failed");
      }
    });
  }
}
