import 'package:flutter/material.dart';

class FormProvider with ChangeNotifier {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _emailError = false;
  bool _passwordError = false;
  bool _usernameError = false;

  // setter

  set setEmailError(bool val) {
    _emailError = val;
    notifyListeners();
  }

  set setPasswordError(bool val) {
    _passwordError = val;
    notifyListeners();
  }

  set setUsernameError(bool val) {
    _usernameError = val;
    notifyListeners();
  }

  // getter

  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  GlobalKey<FormState> get formKey => _formKey;

  bool get emailError => _emailError;
  bool get passwordError => _passwordError;
  bool get usernameError => _usernameError;

  // method
  refresh() => notifyListeners();
}
