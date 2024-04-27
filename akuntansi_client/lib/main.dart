import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/core/utils/session.dart';
import 'package:flutter/material.dart';

import 'core/utils/helper.dart';
import 'main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await init();
    locator.isReady<Session>().then((_) => {runApp(const MainApp())});
  } catch (e) {
    logMe(e);
  }
}
