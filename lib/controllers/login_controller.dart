import 'package:flutter/cupertino.dart';
import 'package:splashscreen/services/prefs_service.dart';

class LoginController {
  ValueNotifier<bool> inLoading = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _password;
  setPassword(String value) => _password = value;

  Future<bool> auth() async {
    inLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    inLoading.value = false;
    print('Login: $_login, password: $_password');
    if (_login == '123' && _password == '123') {
      PrefsService.save(_login!);
      return true;
    }
    return false;
  }
}
