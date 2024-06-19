import 'package:akuntansi_client/core/utils/session.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dimens.dart';
import 'injection.dart';

Widget mediumVerticalSpacing() => const SizedBox(height: sizeMedium);
Widget largeVerticalSpacing() => const SizedBox(height: sizeLarge);

logMe(Object? obj) {
  if (kDebugMode) {
    print(obj);
  }
}

void showLoading() {
  SmartDialog.showLoading(
    backDismiss: false,
    builder: (context) =>
        const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
  );
}

void dismissLoading() {
  SmartDialog.dismiss();
}

void showToast({required String message, Color? color}) {
  Fluttertoast.showToast(
      backgroundColor: color ?? Colors.black,
      msg: message,
      fontSize: 18,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1);
}

Future<void> sessionLogOut() async {
  final session = locator<Session>();
  await session.clearSession();
}

String mergePriceTxt(String price) {
  final session = locator<Session>();
  String currency = session.currency;
  String result;
  result = '$currency$price ';

  return result;
}
