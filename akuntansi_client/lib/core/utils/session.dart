import 'package:akuntansi_client/core/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Session {
  set setLoggedIn(bool login);
  set setUserId(String userId);
  set setCurrency(String currency);
  set setnamaUsaha(String namaUsaha);

  bool get isLoggedIn;
  String get userId;
  String get currency;
  String get namaUsaha;

  Future<void> clearSession();
}

class SessionHelper implements Session {
  final SharedPreferences pref;

  SessionHelper({required this.pref});

  @override
  set setLoggedIn(bool login) {
    pref.setBool(IS_LOGGEDIN, login);
  }

  @override
  set setnamaUsaha(String namaUsaha) {
    pref.setString(NAMA_USAHA, namaUsaha);
  }

  @override
  set setUserId(String userId) {
    pref.setString(USER_ID, userId);
  }

  @override
  set setCurrency(String currency) {
    pref.setString(CURRENCY, currency);
  }

  @override
  bool get isLoggedIn => pref.getBool(IS_LOGGEDIN) ?? false;

  @override
  String get namaUsaha => pref.getString(NAMA_USAHA) ?? '';

  @override
  String get userId => pref.getString(USER_ID) ?? '';

  @override
  String get currency => pref.getString(CURRENCY) ?? '';

  @override
  Future<void> clearSession() async {
    await pref.clear();
  }
}
