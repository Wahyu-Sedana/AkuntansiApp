import 'package:akuntansi_client/core/utils/session.dart';

import 'injection.dart';

Future<bool> checkUserSession() async {
  final session = locator<Session>();
  return session.isLoggedIn;
}
