import 'package:flutter/material.dart';

class FormProvider with ChangeNotifier {
  final TextEditingController _namaUsahaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _emailError = false;
  bool _passwordError = false;
  bool _namaUsahaError = false;
  bool _alamatError = false;

  // setter

  set setEmailError(bool val) {
    _emailError = val;
    notifyListeners();
  }

  set setPasswordError(bool val) {
    _passwordError = val;
    notifyListeners();
  }

  set setnamaUsahaError(bool val) {
    _namaUsahaError = val;
    notifyListeners();
  }

  set setAlamatError(bool val) {
    _alamatError = val;
    notifyListeners();
  }

  // getter

  TextEditingController get namaUsahaController => _namaUsahaController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get alamatController => _alamatController;

  GlobalKey<FormState> get formKey => _formKey;

  bool get emailError => _emailError;
  bool get passwordError => _passwordError;
  bool get namaUsahaError => _namaUsahaError;
  bool get alamatError => _alamatError;

  // method
  refresh() => notifyListeners();
}
