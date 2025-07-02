import 'package:client_project/services/user_service.dart';
import 'package:client_project/utils/toastification_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals/signals_flutter.dart';

class LoginController with ToastificationHelper {
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();
  final _userService = Modular.get<UserService>();
  final Signal hidePassword = Signal(true);

  void changeHidePassword() {
    hidePassword.value = !hidePassword.value;
  }

  Future<void> entrar() async {
    try {
      if (email.text.isEmpty) {
        showAlertError('Informe um e-mail');
        return;
      }
      if (senha.text.isEmpty) {
        showAlertError('Informe uma senha');
        return;
      }
      await _userService.entrar(email.text, senha.text);
      showAlertSuccess('Login realizado com sucesso');
      Modular.to.pushReplacementNamed('/conta');
    } on FirebaseAuthException catch (_) {
      showAlertError('Não foi possível fazer login');
    }
  }
}
